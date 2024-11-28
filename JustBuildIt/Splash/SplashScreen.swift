//
//  SplashScreen.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 11/26/24.
//

import SwiftUI

struct SplashScreen: View {
    
    var body: some View {
        ZStack{
            Image("letsBuildIt")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
        }
        
        
    }
}

#Preview {
    SplashScreen()
}
