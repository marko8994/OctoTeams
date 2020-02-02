//
//  BasicCollectionContainerCell.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

public protocol BasicCollectionContainerActionDelegate: class {
    func cell(_ cell: BasicCollectionContainerCell,
              collectionItemSelectedWithUserData userData: UserData?)
}
public extension BasicCollectionContainerActionDelegate {
    func cell(_ cell: BasicCollectionContainerCell,
              collectionItemSelectedWithUserData userData: UserData?) {}
}

public class BasicCollectionContainerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var constraintCollectionViewHeight: NSLayoutConstraint!

    public var collectionDataSource: BasicCollectionDataSource!
    public var collectionViewHeight: CGFloat? {
        didSet {
            if let collectionViewHeight = collectionViewHeight,
                let constraintCollectionViewHeight = constraintCollectionViewHeight,
                constraintCollectionViewHeight.constant != collectionViewHeight {
                constraintCollectionViewHeight.constant = collectionViewHeight
                setNeedsLayout()
            }
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        if let collectionViewHeight = collectionViewHeight {
            constraintCollectionViewHeight.constant = collectionViewHeight
        }
    }

    public func configure(items: [BasicCellDataSource],
                          actionDelegate: BasicCollectionContainerActionDelegate? = nil) {
        collectionDataSource = BasicCollectionDataSource(containerCell: self,
                                                         collectionView: collectionView,
                                                         items: items,
                                                         actionDelegate: actionDelegate)
        self.collectionView.delegate = collectionDataSource
        self.collectionView.dataSource = collectionDataSource
        self.collectionView.reloadData()
    }
}

