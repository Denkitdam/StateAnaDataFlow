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
    }
    
    func removeUser() {
        userDefaults.removeObject(forKey: key)
    }
    func fetchUser() -> User {
        guard let data = userDefaults.data(forKey: key) else { return User(name: "") }
        guard let user = try? JSONDecoder().decode(User.self, from: data) else { return User(name: "") }
        return user
    }
    
    
}
