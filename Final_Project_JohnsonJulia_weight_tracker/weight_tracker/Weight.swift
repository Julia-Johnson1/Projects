//
//  Weight.swift
//  weight_tracker
//
//  Created by Julia Parker on 6/22/23.
//

import Foundation



struct Weight: Codable {
    var date: Date
    var weight: String
    
    
    
    static var archiveURL: URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsURL.appendingPathComponent("weightDate").appendingPathExtension("plist")

        return archiveURL
    }
    
    static var emptyWeight: [Weight] = []
    
    static func saveToFile(weightDate: [Weight]) {
        let encoder = PropertyListEncoder()
        do {
            let encodedWeight = try encoder.encode(weightDate)
            try encodedWeight.write(to: Weight.archiveURL)
        } catch {
            print("Error encoding weight \(error)")
        }
    }

    static func loadFromFile() -> [Weight]? {
        guard let weightData = try? Data(contentsOf: Weight.archiveURL) else {
            return nil
        }

        do {
            let decoder = PropertyListDecoder()
            let decodedWeight = try decoder.decode([Weight].self, from: weightData)

            return decodedWeight
        } catch {
            print("Error decoding weight: \(error)")
            return nil
        }
    }

}

