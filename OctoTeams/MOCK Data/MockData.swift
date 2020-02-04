//
//  TeamMemberData.swift
//  OctoTeams
//
//  Created by Sara on 9/29/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import Foundation

public typealias HomeData = (logoUrl: String, description: String,
                            teams: [LightTeam], products: [LightProduct])

public class MockData {
    
    static let shared = MockData()
    
    public func loadJSONData(from file: String, with fileExtension: String = "json") -> Any? {
        guard let filepath = Bundle.main.url(forResource: file, withExtension: fileExtension) else {
            print("Failed to locate mock data resources")
            return nil
        }
        guard let data = try? Data(contentsOf: filepath, options: Data.ReadingOptions.mappedIfSafe) else {return nil}
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data,
                                                              options: [.mutableContainers])
            return jsonObject
        } catch let error {
            print(error)
            return nil
        }
    }
    
    public func fetchHome() -> HomeData? {
        guard let homeJsonData = loadJSONData(from: "Home") as? Parameters else {
            return nil
        }
        do {
            let logoUrl: String = try homeJsonData.valueForKey("LogoURL")
            let description: String = try homeJsonData.valueForKey("Description")
            let teams: [LightTeam] = try homeJsonData.arrayForKey("Teams")
            let products: [LightProduct] = try homeJsonData.arrayForKey("Products")
            return HomeData(logoUrl: logoUrl, description: description,
                            teams: teams, products: products)
            
        } catch let error {
            print("Error during fetching home data with error: \(error)")
            return nil
        }
    }
    
    public func fetchTeam(with uid: String) -> Team? {
        guard let teamJsonData = loadJSONData(from: uid) as? Parameters else {
            return nil
        }
        do {
            let team = try Team(dictionary: teamJsonData)
            return team
        } catch let error {
            print("Error during fetching team data with error: \(error)")
            return nil
        }
    }
    
    public func fetchProduct(with uid: String) -> Product? {
        guard let teamJsonData = loadJSONData(from: uid) as? Parameters else {
            return nil
        }
        do {
            let product = try Product(dictionary: teamJsonData)
            return product
        } catch let error {
            print("Error during fetching product data with error: \(error)")
            return nil
        }
    }
}
