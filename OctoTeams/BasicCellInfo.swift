//
//  BasicCellInfo.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import Foundation
import UIKit

public struct BasicCellInfo: BasicCellDataSource {
    public var userData: UserData?
    public var imageUrl: String?
    public var title: String?
    public weak var actionDelegate: BasicCellActionDelegate?

    public init(userData: UserData? = nil,
                imageUrl: String? = nil,
                title: String? = nil,
                actionDelegate: BasicCellActionDelegate? = nil) {
        self.userData = userData
        self.imageUrl = imageUrl
        self.title = title
        self.actionDelegate = actionDelegate
    }
}
