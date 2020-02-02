//
//  HomeViewController.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

public enum HomeSection: Int {
    case teams = 0
    case products
}

class HomeViewController: UITableViewController {
    
    var model: HomeData!
    private var cellInfos = [HomeSection: [BasicCellInfo]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
        setupCellInfos()
    }
    
    private func setupModel() {
        if let model = MockData.shared.fetchHome() {
            self.model = model
        } else {
            model = HomeData(logo: "", description: "",
                             teams: [LightTeam](), products: [LightProduct]())
        }
    }
    
    private func setupCellInfos() {
        var teamCellInfos = [BasicCellInfo]()
        for team in model.teams {
            let userData = team.name
            let cellInfo = BasicCellInfo(userData: userData, imageUrl: team.imageUrl, title: team.name)
            teamCellInfos.append(cellInfo)
        }
        cellInfos[.teams] = teamCellInfos
        var productCellInfos = [BasicCellInfo]()
        for product in model.products {
            let userData = product.name
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "basicCollectionContainerCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? BasicCollectionContainerCell {
            if indexPath.section ==  HomeSection.products.rawValue, let items = cellInfos[.products] {
                cell.configure(items: items, actionDelegate: self)
                setCollectionItemSize(forItems: items, cell: cell, indexPath: indexPath)
                return cell
            } else if indexPath.section == HomeSection.teams.rawValue, let items = cellInfos[.teams] {
                cell.configure(items: items, actionDelegate: self)
                setCollectionItemSize(forItems: items, cell: cell, indexPath: indexPath)
                return cell
            }
            
        }
        fatalError("Could not find cell with identifier \(reuseIdentifier)")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
}

extension HomeViewController: BasicCollectionContainerActionDelegate {
    
}
