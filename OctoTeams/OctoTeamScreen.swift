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
    var members: [TeamMember] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Octo End User apps team members"
        members = createMembers()
        
    }

    func createMembers() -> [TeamMember] {
        
        var temporaryMembers:  [TeamMember] = []
        
        // let teams = ["OIPI Developers", "OIPI QA", "OIPA Developers", "OIPA QA"]
        
        let names = ["Vojko Babic", "Branko Ivandekic", "Igor Drljic", "Marko Mladenovic", "Jelena Lisica", "Sara Konstantinovic", "Marko Zivojnovic", "Aleksandar Ilic", "Boro Milovanovic", "Milos Damjanovic", "Marija Bojcic"]
        for index in 0..<names.count {
            let member = TeamMember(name: names[index])
            temporaryMembers.append(member)
        }
        
        return temporaryMembers
    
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
