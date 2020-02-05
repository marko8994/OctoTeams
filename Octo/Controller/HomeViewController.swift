//
//  HomeViewController.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

public enum HomeSection: Int {
    case description = 0
    case teams
    case products
}

class HomeViewController: UITableViewController {
    
    var model: HomeData!
    private var cellInfos = [HomeSection: [BasicCellInfo]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
        setupCellInfos()
        setUpHeaderView()
        self.navigationItem.title = "Octo"
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func setupModel() {
        if let model = MockData.shared.fetchHome() {
            self.model = model
        } else {
            model = HomeData(logoUrl: "", description: "",
                             teams: [LightTeam](), products: [LightProduct]())
        }
    }
    
    private func setUpHeaderView() {
        if let spotlight = Bundle.main.loadNibNamed("SpotlightView",
                                                    owner: self,
                                                    options: nil)?.first as? SpotlightView {
            spotlight.configure(imageUrl: model.logoUrl)
            tableView.tableHeaderView = spotlight
            self.tableView.tableHeaderView = self.tableView.tableHeaderView
        }
    }
    
    private func setupCellInfos() {
        var teamCellInfos = [BasicCellInfo]()
        for team in model.teams {
            let userData = (section: HomeSection.teams, teamUid: team.uid)
            let cellInfo = BasicCellInfo(userData: userData, imageUrl: team.imageUrl, title: team.name)
            teamCellInfos.append(cellInfo)
        }
        cellInfos[.teams] = teamCellInfos
        var productCellInfos = [BasicCellInfo]()
        for product in model.products {
            let userData = (section: HomeSection.products, productUId: product.uid)
            let cellInfo = BasicCellInfo(userData: userData, imageUrl: product.imageUrl, title: product.name)
            productCellInfos.append(cellInfo)
        }
        cellInfos[.products] = productCellInfos
    }
    
    private func setCollectionItemSize(forItems items: [BasicCellInfo],
                                       cell: BasicCollectionContainerCell,
                                       indexPath: IndexPath) {
        if let flowLayout = cell.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            if items.count == 1 {
                let collectionViewSectionPadding: CGFloat = 15
                flowLayout.itemSize.width = UIScreen.main.bounds.width - (collectionViewSectionPadding * 2)
            } else {
                if DeviceInfo.isCompactScreen {
                    flowLayout.itemSize.width = 140.0
                } else {
                    flowLayout.itemSize.width = 160.0
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "teamDetails", let teamDetailsVC = segue.destination as? TeamDetailsViewController,
            let teamUid = sender as? String {
            teamDetailsVC.teamUid = teamUid
        } else if segue.identifier == "productDetails",
            let productDetailsVC = segue.destination as? ProductDetailsViewController,
            let productUid = sender as? String {
            productDetailsVC.productUid = productUid
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let section = HomeSection(rawValue: indexPath.section) {
            switch section {
            case .description:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") {
                    cell.textLabel?.text = model.description
                    return cell
                }
            case .products, .teams:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "basicCollectionContainerCell",
                                                            for: indexPath) as? BasicCollectionContainerCell,
                    let items = cellInfos[section] {
                    cell.configure(items: items, actionDelegate: self)
                    setCollectionItemSize(forItems: items, cell: cell, indexPath: indexPath)
                    return cell
                }
            }
        }
        fatalError("Could not find cell with set identifier")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let section = HomeSection(rawValue: section) {
            switch section {
            case .description:
                return NSLocalizedString("Common.SectionTitle.AboutCompany", comment: "")
            case .teams:
                return NSLocalizedString("Common.SectionTitle.Teams", comment: "")
            case .products:
                return NSLocalizedString("Common.SectionTitle.Products", comment: "")
            }
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if HomeSection(rawValue: indexPath.section) == .description {
            return UITableView.automaticDimension
        } else {
            return 190.0
        }
    }

}

extension HomeViewController: BasicCollectionContainerActionDelegate {
    
    public func cell(_ cell: BasicCollectionContainerCell,
                 collectionItemSelectedWithUserData userData: Any?) {
        if let params = userData as? (HomeSection, String) {
            if params.0 == .teams {
                performSegue(withIdentifier: "teamDetails", sender: params.1)
            } else if params.0 == .products {
                performSegue(withIdentifier: "productDetails", sender: params.1)
            }
        }
    }
}
