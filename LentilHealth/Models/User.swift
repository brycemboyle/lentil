//
//  User.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
