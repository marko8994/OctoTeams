//
//  OctoTeamScreen.swift
//  OctoTeams
//
//  Created by Sara on 9/27/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import UIKit

class OctoTeamScreen: UIViewController {

    
    @IBOutlet weak var membersList: UITableView!
    var members = [TeamMember]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Octo End User apps team members"
        members = JsonParser.shared.loadJSONData()! as [TeamMember]
        membersList.reloadData()
       
    }
}


extension OctoTeamScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MemberCell"
        let member = members[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! MemberCell
        cell.setMember(member: member)
        return cell
    }
    
    
    
    
    
}
