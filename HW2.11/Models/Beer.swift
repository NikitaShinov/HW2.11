//
//  Beer.swift
//  HW2.11
//
//  Created by Никита Шинов on 01.12.2021.
//

import Foundation


struct Beer: Codable {
    
    let name: String?
    let imageURL: String?
    let abv: Double?
    let ibu: Double?
    let beerDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case name, abv, ibu
        case imageURL = "image_url"
        case beerDescription = "description"
    }
    
    init (beer: [String: Any]) {
        name = beer["name"] as? String
        imageURL = beer["image_url"] as? String
        abv = beer["abv"] as? Double
        ibu = beer["ibu"] as? Double
        beerDescription = beer["description"] as? String
    }
    
    static func getBeers (from value: Any) -> [Beer] {
        guard let beersData = value as? [[String: Any]] else { return [] }
        return beersData.compactMap { Beer(beer: $0)
        }
    }
    
}
