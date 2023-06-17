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
        guard let data = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(data, forKey: key)
        print("user added")
    }
    
    func removeUser() {
        userDefaults.removeObject(forKey: key)
        print("user deleted")
    }
    
    
}
