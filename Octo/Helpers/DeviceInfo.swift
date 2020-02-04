//
//  DeviceInfo.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import Foundation
import UIKit

public class DeviceInfo {
    public static var isCompactScreen: Bool = {
        return UIScreen.main.bounds.width <= 320
    }()

    public static var bottomInset: CGFloat = {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }()

    public static var statusBarHeight: CGFloat = {
        return UIApplication.shared.statusBarFrame.size.height
    }()
}
