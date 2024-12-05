//
//  CategoryProductsViewModel.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 30/11/24.
//

import Foundation
@MainActor
class CategoryProductsViewModel: ObservableObject{
    @Published var categoryProductsModel: [CategoryProductsModel] = []
    func fetchCategoryProducts(from id: String,completion: (Bool) -> Void ) async{
        let catId = APIEndpoint.getCategoryProducts.url + "/\(id)"
            do{
                self.categoryProductsModel = try await NetworkManager
                    .fetchData(
                        from: catId,
                        as: [CategoryProductsModel].self
                    )
                completion(true)
            }catch {
                completion(false)
            }
        
    }
}
