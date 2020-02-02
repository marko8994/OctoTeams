//
//  BasicCollectionDataSource.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import Foundation
import UIKit

public class BasicCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    private weak var basicContainerCell: BasicCollectionContainerCell?
    private weak var collectionView: UICollectionView!
    private var items: [BasicCellDataSource]
    public weak var actionDelegate: BasicCollectionContainerActionDelegate?

    init(containerCell: BasicCollectionContainerCell,
         collectionView: UICollectionView,
         items: [BasicCellDataSource],
         actionDelegate: BasicCollectionContainerActionDelegate? = nil) {
        self.basicContainerCell = containerCell
        self.collectionView = collectionView
        self.items = items
        self.actionDelegate = actionDelegate
    }

    // MARK: UICollectionViewDataSource methods

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let reuseIdentifier = "basicCollectionCell"
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                             for: indexPath)
                as? (UICollectionViewCell & BasicCell) {
                let item = items[indexPath.row]
                cell.configure(with: item)
                return cell
            }
            fatalError("No cell with reuse identifier: \(reuseIdentifier) for row: \(indexPath.row)")
    }

    // MARK: UICollectionViewDelegate methods

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        if let containerCell = basicContainerCell, let userData = item.userData {
            actionDelegate?.cell(containerCell, collectionItemSelectedWithUserData: userData)
        }
    }

}
