//
//  TeamMember.swift
//  OctoTeams
//
//  Created by Sara on 9/27/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import Foundation

public class TeamMember: Codable {

    var MemberUid: String?
    var MemberName: String?
    var MemberImageURL: String?
    var MemberTeam: String?
    var MemberPosition: String?
    var MemberTitle: String?
    var MemberExperience: String?

    
    init(uid: String, name: String, imageUrl: String, team: String, position: String, title: String, experience: String) {
        self.MemberUid = uid
        self.MemberName = name
        self.MemberImageURL = imageUrl
        self.MemberTeam = team
        self.MemberPosition = position
        self.MemberTitle = title
        self.MemberExperience = experience
    }
    
    
    
    
    
    
    
    
}
