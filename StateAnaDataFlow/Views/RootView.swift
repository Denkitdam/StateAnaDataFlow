//
//  RootView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var user = UserSettings()
    private let storageManager = StorageManager.shared
    
    var body: some View {
        Group {
            if user.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .onAppear(perform: fetchUser)
        .environmentObject(user)
    }
    
    private func fetchUser() {
        let storedUser = storageManager.fetchUser()
        user.name = storedUser.name
        user.isLoggedIn.toggle()
    }
    
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
