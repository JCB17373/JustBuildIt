//
//  LoaderManager.swift
//  JustBuildIt
//
//  Created by Aman Bhatt on 28/11/24.
//

import Foundation
class LoaderManager: ObservableObject {
    static let shared = LoaderManager()
    @Published var isLoading: Bool = false
}
