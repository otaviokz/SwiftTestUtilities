//
//  JsonLoader.swift
//  
//
//  Created by Otávio Zabaleta on 03/06/2023.
//

import Foundation

class JsonLoader {
    static func loadJson<T: Decodable>(_ filename: String, bundle: Bundle? = nil) throws -> T {
        let bundle = bundle ?? Bundle(for: Self.self)
        guard let file = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't find \(filename) in test bundle.")
        }
        
        return try JSONDecoder().decode(T.self, from: try Data(contentsOf: file))
    }
}
