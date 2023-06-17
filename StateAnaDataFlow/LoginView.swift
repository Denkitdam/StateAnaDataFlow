//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var buttonBlur = true
    
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
            .disabled(buttonBlur)
        }
        .padding()
        .onChange(of: name) { newValue in
            user.validate(name: name)
            lettersCounter = name.count
            if user.isValid {
                buttonBlur = false
                counterColor = Color(.green)
            }
        }
    }
    
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
            userName = name
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
