//
//  NetworkManager.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 27/11/24.
//

import Foundation
enum APIEndpoint: String{
    static let baseURL = "https://fakestoreapi.com"
    case getProducts = "/products"
    var url: String {
            return "\(APIEndpoint.baseURL)\(self.rawValue)"
        }
}
class NetworkManager{
    static func fetchData<T: Decodable>(from urlString: String, as type: T.Type) async throws -> T {
            guard let url = URL(string: urlString) else {
                throw URLError(.badURL)
            }
        print(url)
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        }
}
