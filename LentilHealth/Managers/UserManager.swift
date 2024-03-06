//
//  UserManager.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 3/5/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {
    
    static let shared = UserManager()
    private init() {}
    
    func createNewUser(userId: String, name: String, email: String) async throws {
        var userData: [String:Any] = [
            "user_id" : userId,
            "name" : name,
            "email" : email,
            "joined" : Date().timeIntervalSince1970
        ]
        try await Firestore.firestore().collection("users").document(userId).setData(userData, merge: false)
    }
    
}
