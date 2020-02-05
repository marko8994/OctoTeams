//
//  BasicCollectionCell.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

public class BasicCollectionCell: UICollectionViewCell, BasicCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subviewsContainer: UIView!
    
    public var userData: UserData?
    public weak var actionDelegate: BasicCellActionDelegate?

    public func configure(with info: BasicCellDataSource) {
        configureImageView(with: info)
        configureTitleLabel(with: info)
        userData = info.userData
        self.actionDelegate = info.actionDelegate
        setNeedsLayout()
        layoutIfNeeded()
    }


    private func configureImageView(with info: BasicCellDataSource) {
        guard let imageView = imageView else {return}
        if let imagePath = info.imageUrl, let imageUrl = URL(string: imagePath),
            let imageData = try? Data(contentsOf: imageUrl) {
            imageView.image = UIImage(data: imageData)
        }
    }

    private func configureTitleLabel(with info: BasicCellDataSource) {
        guard let titleLabel = titleLabel else {return}
        titleLabel.text = info.title
    }

    private func setLayout() {
        let cornerRadius: CGFloat = 10.0
        subviewsContainer?.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        subviewsContainer?.backgroundColor = UIColor.lightGray
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
