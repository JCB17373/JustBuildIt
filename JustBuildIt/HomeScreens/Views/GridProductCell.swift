//
//  GridProductCell.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 29/11/24.
//

import SwiftUI

struct GridProductCell: View {
    var products: HomeModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        NavigationLink {
            
        }label:{
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: products.image)) { image in
                    image.resizable()
                } placeholder: {
                    Image("letsBuildIt")
                        .renderingMode(.original)
                        .resizable()
                }
                .frame(width: 155, height: 155)
                .cornerRadius(8)
                .padding()
                Text(products.title)
                    .font(.headline)
                    .padding()
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                HStack {
                    Text("Price:")
                        .font(.headline)
                        .padding()
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    Text("\(products.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.green)
                    
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(colorScheme == .dark ? Color.black.opacity(0.8) : Color.white)
                    .shadow(color: colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(colorScheme == .dark ? Color.white.opacity(0.3) : Color.black.opacity(0.4), lineWidth: 1)
            )
            
            
        }
        
    }
}

#Preview {
    let products: [HomeModel] = []
    GridProductCell(products: products[0])
}
