//
//  HomeModel.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 27/11/24.
//

import Foundation
import SwiftUI

struct HomeModel: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    private var rating: Rating
    struct Rating: Hashable, Codable {
        var rate: Double
        var count: Int
    }
}
func loadJSONData<T: Decodable>(_ data: Data) -> T {
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse")
    }
}
