//
//  LightTeam.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import Foundation

public struct LightTeam: Deserializable {
    public let uid: String
    public let name: String
    public let imageUrl: String
    
    public init(dictionary: Parameters) throws {
        uid = try dictionary.valueForKey("UID")
        name = try dictionary.valueForKey("Name")
        imageUrl = try dictionary.valueForKey("ImageURL")
    }
}

public struct LightProduct: Deserializable {
    public let uid: String
    public let name: String
    public let imageUrl: String
    
    public init(dictionary: Parameters) throws {
        uid = try dictionary.valueForKey("UID")
        name = try dictionary.valueForKey("Name")
        imageUrl = try dictionary.valueForKey("ImageURL")
    }
}
