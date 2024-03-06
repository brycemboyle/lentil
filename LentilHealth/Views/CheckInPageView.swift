//
//  CheckInPageView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/27/24.
//

import SwiftUI

struct CheckInPageView: View {
    @StateObject var viewModel = CheckInPageViewViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    var body: some View {
        NavigationStack {
            VStack {
                CheckInCategoryView(userId: userId, categoryId: "1", selectedItems: [])
                FormButton(title: "get items",
                           background: .blue
                ) {
                    // Attempt login
                    viewModel.fetchAllItems()
                }
            }
            .navigationTitle("Check In")
        }
        
    }
}

#Preview {
    CheckInPageView(userId: "")
}
