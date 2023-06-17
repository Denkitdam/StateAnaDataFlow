//
//  UserSettings.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import Foundation

final class UserSettings: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isValid = false
    var name = ""
    
    func validate(name: String) {
        if name.count == 3 {
            isValid.toggle()
        }
        
    }
}
