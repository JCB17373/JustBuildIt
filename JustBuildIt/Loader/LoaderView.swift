//
//  LoaderView.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 28/11/24.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
          
               
        }
    }
}

#Preview {
    LoaderView()
}
