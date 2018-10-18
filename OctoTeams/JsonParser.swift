//
//  JsonParser.swift
//  OctoTeams
//
//  Created by Sara on 9/29/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import Foundation


public class JsonParser {
    
    public static let shared = JsonParser()
    
    func loadJSONData() -> [TeamMember]? {
        let filename = "MockData"
        let temporaryMembers = [TeamMember]()
        guard let filepath = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("Failed to locate mock data resources")
            return nil
        }
        guard let data = try? Data(contentsOf: filepath,
                                   options: Data.ReadingOptions.mappedIfSafe) else {return nil}
        do {
            let decoder = JSONDecoder()
            let loadedMembers = try decoder.decode([TeamMember].self, from: data)
            let temporaryMembers = loadedMembers
            
        } catch let error {
            print("Error parsing json", error)
        }
        return temporaryMembers
    }

//    public func loadJSONData() -> [TeamMember]? {
//        let filename = "MockData"
//        guard let filepath = Bundle.main.url(forResource: filename, withExtension: "json") else {
//            print("Failed to locate mock data resources")
//            return nil
//        }
//        guard let data = try? Data(contentsOf: filepath,
//                                   options: Data.ReadingOptions.mappedIfSafe) else {return nil}
//        do {
//            let decoder = JSONDecoder()
//            let members = try decoder.decode([TeamMember].self, from: data)
//            let temporaryMembers = members
//        
//        } catch let error {
//            print("Error parsing json", error)
//        }
//    } 
}
