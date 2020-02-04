//
//  Team.swift
//  OctoTeams
//
//  Created by Marko Mladenovic on 2/3/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import Foundation

public struct Team: Deserializable {
    public let uid: String
    public let name: String
    public let description: String
    public let imageURL: String
    public let teamMembers: [TeamMember]
    
    public init(uid: String = "", name: String = "", description: String = "",
                imageUrl: String = "", teamMembers: [TeamMember] = [TeamMember]()) {
        self.uid = uid
        self.name = name
        self.description = description
        self.imageURL = imageUrl
        self.teamMembers = teamMembers
    }
    
    public init(dictionary: Parameters) throws {
        uid = try dictionary.valueForKey("UID")
        name = try dictionary.valueForKey("Name")
        imageURL = try dictionary.valueForKey("ImageURL")
        description = try dictionary.valueForKey("Description")
        teamMembers = try dictionary.arrayForKey("Members")
    }
}
