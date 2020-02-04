//
//  Dictionary+Keys.swift
//  OctoTeams
//
//  Created by aleksa on 2/2/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any? {

    public func valueForKey<ResultType>(_ key: String) throws -> ResultType {
        if let value = self[key] as? ResultType {
            return value
        }
        throw OCError.parsingError(message: "No value found for key: \(key)")
    }
    
    public func arrayForKey<ResultType: Deserializable>(_ key: String) throws -> [ResultType] {
        if let arrayOfDict = self[key] as? [Parameters] {
            return try arrayOfDict.deserialize()
        }
        throw OCError.parsingError(message: "No value found for \(key)")
    }
}

extension Array where Element == Parameters {

    public func deserialize<T: Deserializable>() throws -> [T] {
        return self.compactMap({ dictionary in
            return try? T(dictionary: dictionary)
        })
    }

}
