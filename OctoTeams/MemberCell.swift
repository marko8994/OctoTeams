//
//  MemberCell.swift
//  OctoTeams
//
//  Created by Sara on 9/27/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import UIKit

class MemberCell: UITableViewCell {

    @IBOutlet weak var memberNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    func configure(for member:TeamMember) {
        memberNameLabel.text = member.name
    }
    
    
    
    

}
