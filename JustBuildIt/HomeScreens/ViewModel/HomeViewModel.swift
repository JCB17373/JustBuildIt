//
//  HomeViewModel.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 27/11/24.
//

import Foundation
import SwiftUI

@MainActor class HomeViewModel: ObservableObject {
    @Published var products: [HomeModel] = []
    var categories: [String: [HomeModel]]{
          Dictionary(
              grouping: products,
              by: { $0.category }
          )
      }
    func loadProducts(completion: (Bool) -> Void ) async{
        do{
            self.products = try await NetworkManager
                .fetchData(
                    from: APIEndpoint.getProducts.url,
                    as: [HomeModel].self
                )
            completion(true)
        }catch {
            completion(false)
            
        }
    }
}
