//
//  BasicCell.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import Foundation
import UIKit

public typealias UserData = Any

// MARK: BasicCell
public protocol BasicCell {
    func configure(with dataSource: BasicCellDataSource)
}

// MARK: BasicCellActionDelegate
public protocol BasicCellActionDelegate: class {
    func cell(_ cell: BasicCell,
              itemActionPerformedWithUserData userData: UserData?)
}

public extension BasicCellActionDelegate {
    func cell(_ cell: BasicCell,
              itemActionPerformedWithUserData userData: UserData?) {}
}

// MARK: BasicCellDataSource
public protocol BasicCellDataSource {
    var image: UIImage? { get }
    var imageUrl: String? { get }
    var title: String? { get }
    var userData: UserData? { get }
    var actionDelegate: BasicCellActionDelegate? { get }
}

// MARK: Optional data source info
public extension BasicCellDataSource {
    var image: UIImage? { return nil }
    var imageUrl: String? { return nil }
    var title: String? { return nil }
    var userData: UserData? { return nil }
    var actionDelegate: BasicCellActionDelegate? { return nil }
}

