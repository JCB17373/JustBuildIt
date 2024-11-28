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
    func loadProducts(completion: (Bool) -> Void ) async{
        do{
            self.products = try await NetworkManager
                .fetchData(
                    from: APIEndpoint.getProducts.url,
                    as: [HomeModel].self
                )
            completion(true)
            print(self.products)
        }catch {
            completion(false)
            
        }
    }
}
