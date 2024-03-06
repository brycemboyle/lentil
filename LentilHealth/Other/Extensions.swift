//
//  Extensions.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import Foundation

// HELP

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
