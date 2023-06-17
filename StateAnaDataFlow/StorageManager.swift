//
//  StorageManager.swift
//  StateAnaDataFlow
//
//  Created by Denis Kitaev on 17.06.2023.
//

import Foundation


final class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "User"
    
    private init() {}
    
    
    func add(user: User) {
        userDefaults.set(user, forKey: key)
    }
    
    func removeUser() {
        userDefaults.removeObject(forKey: key)
    }
    
    
}
