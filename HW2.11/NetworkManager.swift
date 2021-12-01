//
//  NetworkManager.swift
//  HW2.11
//
//  Created by Никита Шинов on 01.12.2021.
//

import Foundation

let link = "https://api.punkapi.com/v2/beers"

enum NetworkError: Error {
    
    case invalidURL
    case noData
    case decodingError
    
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    

}
