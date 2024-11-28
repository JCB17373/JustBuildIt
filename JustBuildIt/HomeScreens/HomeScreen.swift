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
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.products){ products in
                    VStack(alignment: .leading) {
                        Text(products.title).font(.headline)
                        Text(products.description).font(.subheadline)
                    }
                }.navigationTitle("Lets Build it")
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
