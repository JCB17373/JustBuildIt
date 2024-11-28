//
//  ToastView.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 28/11/24.
//

import SwiftUI

struct ToastView: View {
  
  var style: ToastStyle
  var message: String
  var width = CGFloat.infinity
  var onCancelTapped: (() -> Void)
  
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Image(systemName: style.iconFileName)
        .foregroundColor(style.themeColor)
      Text(message)
        .font(Font.caption)
        .foregroundColor(Color("toastForeground"))
      
      Spacer(minLength: 10)
      
      Button {
        onCancelTapped()
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(style.themeColor)
      }
    }
    .padding()
    .frame(minWidth: 0, maxWidth: width)
    .background(Color("toastBackground"))
    .cornerRadius(8)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .opacity(0.1)
    )
    .padding(.horizontal, 16)
  }
}

#Preview {
    VStack(spacing: 32) {
      ToastView(
        style: .success,
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
      ToastView(
        style: .info,
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
      ToastView(
        style: .warning,
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
      ToastView(
        style: .error,
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
    }
}
