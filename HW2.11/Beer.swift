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
    
}
