//
//  TeamMemberData.swift
//  OctoTeams
//
//  Created by Sara on 9/29/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import Foundation


public class TeamMemberData {
    
    static let shared = TeamMemberData()
    var teamMembers: [TeamMember]?
    
    func loadJSONData() {
        let filename = "MockData"
        guard let filepath = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("Failed to locate mock data resources")
            return
        }
        guard let data = try? Data(contentsOf: filepath,
                                   options: Data.ReadingOptions.mappedIfSafe) else {return}
        do {
            let decoder = JSONDecoder()
            let loadedMembers = try decoder.decode([TeamMember].self, from: data)
            teamMembers = loadedMembers
        } catch let error {
            print("Error parsing json", error)
        }
    }
}
