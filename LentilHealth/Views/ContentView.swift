//
//  ContentView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            settingsView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var settingsView: some View {
        TabView {
            CheckInPageView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
