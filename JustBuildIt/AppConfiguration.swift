//
//  Endpoints.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 29/11/24.
//

import Foundation
enum APIEndpoint: String{
    static let baseURL = "https://fakestoreapi.com"
    case getProducts = "/products"
    case getCategories = "/products/categories"
    case getCategoryProducts = "/products/category"
    var url: String {
        return "\(APIEndpoint.baseURL)\(self.rawValue)"
    }
}
