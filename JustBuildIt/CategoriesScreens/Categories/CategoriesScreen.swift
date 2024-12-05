//
//  CategoriesScreen.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 30/11/24.
//

import SwiftUI

struct CategoriesScreen: View {
    @EnvironmentObject var loaderManager: LoaderManager
    @StateObject private var viewModel = CategoriesScreenViewModel()
    @State private var toast: Toast? = nil
    var body: some View {
        ZStack{
            NavigationStack {
//                Divider()
                List(viewModel.categories, id: \.self) { category in
                    NavigationLink{
                        CategoryProductsScreen(categoryId: category)
                            .toolbar(.hidden, for: .tabBar)
                    }label: {
                        HStack {
                            Image("letsBuildIt")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(5)
                            Text(category.capitalized)
                                .padding()
                                .font(.headline)
                                .foregroundColor(Color("AccentColor"))
                        }
                        
                    }
                    
                    
                }.navigationTitle("Categories")
                    .task {
                        loaderManager.isLoading = true
                        await viewModel.fetchCategories { success in
                            if !success {
                                DispatchQueue.main.async {
                                    loaderManager.isLoading = false
                                    toast = Toast(style: .error, message: "Failed to fetch categories")
                                }
                            }else{
                                DispatchQueue.main.async {
                                    loaderManager.isLoading = false
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
    CategoriesScreen()
        .environmentObject(LoaderManager())
}
