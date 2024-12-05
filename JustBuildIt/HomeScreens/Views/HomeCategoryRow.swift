//
//  HomeCategoryRow.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 29/11/24.
//

import SwiftUI

struct HomeCategoryRow: View {
    var categories: [String: [HomeModel]]
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
       
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0){
                    ForEach(categories.keys.sorted(), id: \.self){ categories in
                        NavigationLink {
                            CategoryProductsScreen(categoryId: categories)
                                .toolbar(.hidden, for: .tabBar)
                        }label:{
                            VStack{
                                AsyncImage(url: URL(string: "")) { image in
                                    image.resizable()
                                } placeholder: {
                                    Image("letsBuildIt")
                                        .renderingMode(.original)
                                        .resizable()
                                }
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(.white, lineWidth: 4)
                                }
                                .shadow(radius: 4)
                                .frame(width: 155, height: 155)
                                Spacer()
                                Text(categories.capitalized)
                                    .font(.headline)
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                            .padding()
                        }
                    }
                }
            }
            .frame(height: 200)
        
    }
}

#Preview {
    let products: [HomeModel] = []
    HomeCategoryRow(categories: ["category":products])
}
