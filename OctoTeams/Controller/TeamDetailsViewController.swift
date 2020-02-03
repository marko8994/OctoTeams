//
//  TeamViewController.swift
//  OctoTeams
//
//  Created by Marko Mladenovic on 2/3/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

public enum TeamSection: Int {
    case header
    case members
}

class TeamDetailsViewController: UITableViewController {
    
    var teamUid: String!
    private var team: Team!

    override func viewDidLoad() {
        super.viewDidLoad()
        initTeam()
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
        if TeamSection(rawValue: section) == .header {
            return 1
        } else {
            return team.teamMembers.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let section = TeamSection(rawValue: indexPath.section) {
            switch section {
            case .header:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "tableHeaderCell",
                                                            for: indexPath) as? HeaderCell {
                    cell.configure(text: team.description, imageUrl: team.imageURL)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if TeamSection(rawValue: indexPath.section) == .members {
            performSegue(withIdentifier: "memberDetails", sender: team.teamMembers[indexPath.row])
        } else {
            return
        }
    }
}
