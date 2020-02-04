//
//  HeaderCell.swift
//  OctoTeams
//
//  Created by aleksa on 2/3/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    public func configure(text: String, imageUrl: String) {
        descriptionLabel.text = text
        if let imageUrl = URL(string: imageUrl),
            let imageData = try? Data(contentsOf: imageUrl) {
            logoImageView.image = UIImage(data: imageData)
        }
    }

}
