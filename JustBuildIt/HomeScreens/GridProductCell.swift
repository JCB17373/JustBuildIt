//
//  GridProductCell.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 29/11/24.
//

import SwiftUI

struct GridProductCell: View {
    var products: HomeModel
    var body: some View {
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
            Text("Price: \(products.price)")
                .font(.subheadline)
                .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.4), radius: 5, x: 5, y: 5)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black.opacity(0.3), lineWidth: 1)
        )
       
    }
}

#Preview {
    let products: [HomeModel] = []
    GridProductCell(products: products[0])
}
