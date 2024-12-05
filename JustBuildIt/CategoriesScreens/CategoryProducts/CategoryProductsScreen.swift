//
//  CategoryProductsScreen.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 30/11/24.
//

import SwiftUI

struct CategoryProductsScreen: View {
    @EnvironmentObject var loaderManager: LoaderManager
    @StateObject private var viewModel = CategoryProductsViewModel()
    @State private var toast: Toast? = nil
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var categoryId: String
    var body: some View {
        ZStack {
            NavigationStack{
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach(viewModel.categoryProductsModel) { products in
                            CategoryProductCell(products: products)
                        }
                    }
                    .navigationTitle(categoryId.capitalized)
                    .navigationBarTitleDisplayMode(.inline)
                    .task {
                        loaderManager.isLoading = true
                        await viewModel
                            .fetchCategoryProducts(
                                from: categoryId
                            ) { success in
                            if success{
                                DispatchQueue.main.async {
                                    loaderManager.isLoading = false
                                }
                            }else{
                                DispatchQueue.main.async {
                                    loaderManager.isLoading = false
                                    toast = Toast(
                                        style: .error,
                                        message: "Something went wrong!"
                                    )
                                }
                            }
                        }
                    }
                }
                
            }
            if loaderManager.isLoading {
                LoaderView()
            }
        }
        .toastView(toast: $toast)
    }
}

#Preview {
    CategoryProductsScreen(categoryId: "electronics")
        .environmentObject(LoaderManager())
}
