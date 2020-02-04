//
//  Product.swift
//  OctoTeams
//
//  Created by Marko Mladenovic on 2/4/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import Foundation

public struct Product: Deserializable {
    public let uid: String
    public let name: String
    public let imageURL: String
    public let description: String
    public let price: Int
    
    public init(uid: String = "", name: String = "", description: String = "",
                imageUrl: String = "", price: Int = 0) {
        self.uid = uid
        self.name = name
        self.description = description
        self.imageURL = imageUrl
        self.price = price
    }
    
    public init(dictionary: Parameters) throws {
        uid = try dictionary.valueForKey("UID")
        name = try dictionary.valueForKey("Name")
        imageURL = try dictionary.valueForKey("ImageURL")
        description = try dictionary.valueForKey("Description")
        price = try dictionary.valueForKey("Price")

    }
}
