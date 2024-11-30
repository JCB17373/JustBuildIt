//
//  ContentView.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 11/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplashScreen: Bool = true
    @State private var selectedTab = 0
    @StateObject private var loaderManager = LoaderManager.shared
    var body: some View {
        ZStack {
            if showSplashScreen {
                SplashScreen()
            } else {
                TabView(selection: $selectedTab) {
                    // First tab (Home Tab)
                    HomeScreen()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }.tag(0)
                    // Second tab (Categories Tab)
                    CategoriesScreen()
                        .tabItem {
                            Label("Categories", systemImage: "list.bullet")
                        }.tag(1)
                    // Third tab (Search Tab)
                    SearchScreen()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }.tag(2)
                }
                .accentColor(Color("AccentColor"))
                
                
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showSplashScreen = false
                }
                
            }
        }
        .environmentObject(loaderManager)
    }
}

#Preview {
    ContentView()
}
