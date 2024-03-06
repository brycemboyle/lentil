//
//  SettingsView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/27/24.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Details...")
                }
            }
            .navigationTitle("Settings")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // info: name, email
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("User since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970:  user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        // sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        Spacer()
    }
}

#Preview {
    SettingsView()
}
