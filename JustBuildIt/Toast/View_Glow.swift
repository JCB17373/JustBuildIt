//
//  File.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 28/11/24.
//

import Foundation
import SwiftUI

extension View {
  func glow(color: Color = .gray, radius: CGFloat = 20) -> some View {
    self
      .shadow(color: color, radius: radius / 3)
      .shadow(color: color, radius: radius / 3)
      .shadow(color: color, radius: radius / 3)
  }
    func toastView(toast: Binding<Toast?>) -> some View {
      self.modifier(ToastModifier(toast: toast))
    }
}
