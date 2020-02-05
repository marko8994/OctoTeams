//
//  TeamViewController.swift
//  OctoTeams
//
//  Created by Marko Mladenovic on 2/3/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

public enum TeamSection: Int {
    case description
    case members
}

class TeamDetailsViewController: UITableViewController {
    
    var teamUid: String!
    private var team: Team!

    override func viewDidLoad() {
        super.viewDidLoad()
        initTeam()
        setUpHeaderView()
        navigationItem.title = team.name
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func initTeam() {
        if let team = MockData.shared.fetchTeam(with: teamUid) {
            self.team = team
        } else {
            self.team = Team()
        }
    }
    
    private func setUpHeaderView() {
        if let spotlight = Bundle.main.loadNibNamed("SpotlightView",
                                                    owner: self,
                                                    options: nil)?.first as? SpotlightView {
            spotlight.configure(imageUrl: team.imageURL)
            tableView.tableHeaderView = spotlight
            self.tableView.tableHeaderView = self.tableView.tableHeaderView
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memberDetails", let memberDetailsVC = segue.destination as? MemberDetailsViewController,
            let member = sender as? TeamMember {
            memberDetailsVC.member = member
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if TeamSection(rawValue: section) == .description {
            return 1
        } else {
            return team.teamMembers.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let section = TeamSection(rawValue: indexPath.section) {
            switch section {
            case .description:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") {
                    cell.textLabel?.text = team.description
                    return cell
                }
            case .members:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "basicTableCell",
                                                            for: indexPath) as? (UITableViewCell & BasicCell) {
                    let member = team.teamMembers[indexPath.row]
                    let memberInfo = BasicCellInfo(userData: member, title: member.name)
                    cell.configure(with: memberInfo)
                    return cell
                }
            }
        }
        fatalError("Could not find cell with set identifier")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let section = TeamSection(rawValue: section) {
            switch section {
            case .description:
                return NSLocalizedString("Common.SectionTitle.AboutTeam", comment: "")
            case .members:
                return NSLocalizedString("Common.SectionTitle.Members", comment: "")
            }
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if TeamSection(rawValue: indexPath.section) == .members {
            performSegue(withIdentifier: "memberDetails", sender: team.teamMembers[indexPath.row])
        } else {
            return
        }
    }
}
