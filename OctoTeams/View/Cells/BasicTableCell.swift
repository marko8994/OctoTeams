//
//  MemberCell.swift
//  OctoTeams
//
//  Created by Sara on 9/27/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import UIKit

public class BasicTableCell: UITableViewCell, BasicCell {

    @IBOutlet weak var label: UILabel!
    
    public var userData: UserData?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    public func configure(with info: BasicCellDataSource) {
        label.text = info.title
        userData = info.userData
    }
    
}
