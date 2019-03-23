//
//  TeamMember.swift
//  OctoTeams
//
//  Created by Sara on 9/27/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import Foundation

public class TeamMember: Codable {

    var uid: String
    var name: String
    var imageURL: String
    var team: String
    var position: String
    var title: String
    var experience: String

    
    init(uid: String, name: String, imageUrl: String, team: String, position: String, title: String, experience: String) {
        self.uid = uid
        self.name = name
        self.imageURL = imageUrl
        self.team = team
        self.position = position
        self.title = title
        self.experience = experience
    }
    
    
    
    
    
    
    
    
}
