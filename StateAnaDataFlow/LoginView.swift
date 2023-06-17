//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var buttonAccess = true
    
    @State private var lettersCounter = 0
    @State private var counterColor = Color(.red)
    
    
    @EnvironmentObject private var user: UserSettings
    
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
                Text(lettersCounter.formatted())
                    .foregroundColor(counterColor)
            }
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(buttonAccess)
        }
        .padding()
        .onChange(of: name) { newValue in
            lettersCounter = name.count
            validateName()
        }
    }
    
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }
    func validateName() {
        if name.count == 3 {
            buttonAccess.toggle()
            counterColor = Color(.green)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
