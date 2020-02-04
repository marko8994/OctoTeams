//
//  TeamMember.swift
//  OctoTeams
//
//  Created by Sara on 9/27/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any?]

public protocol Deserializable {
    init(dictionary: Parameters) throws
}

public enum OCError: Error {
    case parsingError(message: String)
}

public struct TeamMember: Deserializable {
    public let uid: String
    public let name: String
    public let imageURL: String
    public let position: String
    public let title: String
    public let experience: String
    
    public init(dictionary: Parameters) throws {
        uid = try dictionary.valueForKey("UID")
        name = try dictionary.valueForKey("Name")
        imageURL = try dictionary.valueForKey("ImageURL")
        position = try dictionary.valueForKey("Position")
        title = try dictionary.valueForKey("Title")
        experience = try dictionary.valueForKey("Experience")
    }
}
