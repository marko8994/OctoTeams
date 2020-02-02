//
//  HeaderView.swift
//  OctoTeams
//
//  Created by aleksa on 2/3/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    public func configure(text: String, imageUrl: String) {
        label.text = text
        if let imageUrl = URL(string: imageUrl),
            let imageData = try? Data(contentsOf: imageUrl) {
            imageView.image = UIImage(data: imageData)
        }
    }
}
