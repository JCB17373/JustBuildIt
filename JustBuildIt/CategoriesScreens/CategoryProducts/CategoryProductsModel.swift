//
//  CategoryProductsModel.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 30/11/24.
//

import Foundation
struct CategoryProductsModel: Hashable, Codable, Identifiable {
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
