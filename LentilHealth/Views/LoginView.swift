//
//  LoginView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "Lentil",
                           subtitle: "Correlation Shmorrelation",
                           background: .pink,
                           height: -200)
                
                // Login Form
                // fixme add messages for failed login
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
//                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    FormButton(title: "Log In",
                               background: .blue
                    ) {
                        // Attempt login
                        viewModel.login()
                    }
                    .padding()
                }
                
                // Create Account
                VStack {
                    Text("New user?")
                    // fixme add navigation destination for lazy loading?
                    NavigationLink("Create an Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoginView()
}
