//
//  OctoTeamViewController.swift
//  OctoTeams
//
//  Created by Sara on 9/27/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import UIKit

class OctoTeamViewController: UIViewController {

    @IBOutlet weak var membersList: UITableView!
    var members = [TeamMember]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "OIPI team members"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if let members = TeamMemberData.shared.teamMembers {
            self.members = members
        }
        membersList.tableFooterView = UIView(frame: CGRect.zero)
        membersList.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "teamToMemberDetails" {
            let detailsVC = segue.destination as? MemberDetailsViewController
            detailsVC.member = sender as? TeamMember
        }
    }
}


extension OctoTeamViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MemberCell"
        let member = members[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! MemberCell
        cell.accessoryType = .disclosureIndicator
        cell.setMember(member: member)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        performSegue(withIdentifier: "teamToMemberDetails", sender: member)
    }
    
    
    
    
}
