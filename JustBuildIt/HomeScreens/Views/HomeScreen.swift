//
//  HomeScreen.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 11/26/24.
//

import SwiftUI
struct HomeScreen: View {
    @EnvironmentObject var loaderManager: LoaderManager
    @StateObject private var viewModel = HomeViewModel()
    @State private var toast: Toast? = nil
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(alignment: .top, spacing: 0){
                                HomeCategoryRow(categories: viewModel.categories)
                            }
                        }
                        .frame(height: 200)
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach(viewModel.products) { products in
                            GridProductCell(products: products)
                        }
                    }
                    .navigationTitle("Pseudo Store")
                    .task {
                        loaderManager.isLoading = true
                        await viewModel.loadProducts { success in
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
    HomeScreen()
        .environmentObject(LoaderManager())
}
