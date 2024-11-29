//
//  HomeScreen.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 11/26/24.
//

import SwiftUI
import Combine
struct HomeScreen: View {
    @EnvironmentObject var loaderManager: LoaderManager
    @StateObject private var viewModel = HomeViewModel()
    @State private var toast: Toast? = nil
    @State private var isError = false
    let columns = [
        GridItem(.fixed((UIScreen.main.bounds.width/2) - 10)),         GridItem(.fixed((UIScreen.main.bounds.width/2) - 10))
    ]
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach(viewModel.products) { products in
                            GridProductCell(products: products)
                        }
                    }
                }
                .navigationTitle("Lets Build it")
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
                                    self.isError = true
                                    toast = Toast(
                                        style: .error,
                                        message: "Something went wrong!"
                                    )
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
