//
//  CategoriesScreenViewModel.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 30/11/24.
//

import Foundation
import SwiftUI
@MainActor
class CategoriesScreenViewModel: ObservableObject{
    @Published var categories: [String] = []
    func fetchCategories(completion: (Bool) -> Void ) async{
            do{
                self.categories = try await NetworkManager
                    .fetchData(
                        from: APIEndpoint.getCategories.url,
                        as: [String].self
                    )
                completion(true)
            }catch {
                completion(false)
            }
        
    }
}
