//
//  NetworkManager.swift
//  HW2.11
//
//  Created by Никита Шинов on 01.12.2021.
//

import Foundation
import Alamofire

let link = "https://api.punkapi.com/v2/beers"

enum NetworkError: Error {
    
    case invalidURL
    case noData
    case decodingError
    
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: String, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetchBeerWuthAlamofire (_ url: String, completion: @escaping (Result<[Beer], NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let beers = Beer.getBeers(from: value)
                    completion(.success(beers))
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }

}
