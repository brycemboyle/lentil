//
//  CheckInCategoryViewViewModel.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/27/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Foundation

class CheckInPageViewViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var selectedItems = []
    
    @Published private(set) var items: [Item] = []
    
    init() {}
    
//    func fetchAllItems() {
//        
//    }
    
    func fetchAllItems() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("categories").document("1").collection("items").getDocuments { [weak self] snapshot, error in
            guard let data = snapshot?.docs.data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                    )
            }
        }
    }
    
//    func fetchAllItems() async {
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//        let db = Firestore.firestore()
//        do {
//            let querySnapshot = try await db.collection("users").document(userId).collection("categories").document("1").collection("items").getDocuments()
//            for document in querySnapshot.documents {
//                print("\(document.documentID) => \(document.data())")
//            }
//        } catch {
//            print("Error getting documents: \(error)")
//        }
//    }
    
}
