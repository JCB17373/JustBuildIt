//
//  ContentView.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 11/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplashScreen: Bool = true
    @StateObject private var loaderManager = LoaderManager.shared
    var body: some View {
        ZStack {
            if showSplashScreen {
                SplashScreen()
            } else {
                HomeScreen()
                
                
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
