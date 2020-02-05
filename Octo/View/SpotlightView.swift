//
//  SpotlightView.swift
//  Octo
//
//  Created by Marko Mladenovic on 2/5/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

class SpotlightView: UIView {
    
    @IBOutlet weak var spotlightImage: UIImageView!
    
    public func configure(imageUrl: String) {
        if let imageUrl = URL(string: imageUrl),
            let imageData = try? Data(contentsOf: imageUrl) {
            spotlightImage.image = UIImage(data: imageData)
        }
    }
}
