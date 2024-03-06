//
//  RegisterViewViewModel.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
//    
    init() {}
//    
    func register () async throws{
        print("registering")
        guard validate() else {
            print("invalid")
            return
        }

        print("self")
        print(self)
        // FIXME still logs in even if couldn't add new user to database
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                print("error:")
                print(error)
                return
            }
//            self?.insertUserRecord(id: userId)
            try await addUser(id: userId)
        }
    }
    
    private func addUser(id: String) async throws {
        try await UserManager.shared.createNewUser(userId: id, name: name, email: email)
    }
    
    private func insertUserRecord(id: String) {
        print("inserting")
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            // fixme add message for invalid password and stuff
            print("invalid shit")
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
