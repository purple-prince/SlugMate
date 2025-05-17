//
//  OnboardingView.swift
//  SlugMate
//
//  Created by Charlie Reeder on 5/17/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var email: String = ""
    @State var bold: Bool = false
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                headerText
                
                textFieldSection
                    .padding(.top, 48)
                
                signInButton
                    .padding(.top, 40)
                
                Spacer()
                
                tos
            }
            .padding()
        }
    }
    
    var signInButton: some View {
        Text("Sign In")
            .foregroundStyle(Color.appBackground)
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.appGreen)
            .clipShape(Capsule())
            .shadow(radius: 6, x: 0, y: 4)
            .padding(.horizontal, 4)
            .scaleEffect(isAnimating ? 1.03 : 1)
    }
    
    var textFieldSection: some View {
        VStack(spacing: 48) {
            VStack(alignment: .leading) {
                
                TextField("Email", text: $email)
                    .autocorrectionDisabled()
                    .fixedSize()
                    .font(.title2)
                    .foregroundStyle(Color.appGreen)
                    .bold(bold)
                
                Capsule()
                    .frame(height: 2)
                
            }
            
            VStack(alignment: .leading) {
                
                Text(email.isEmpty ? "Password" : "•••••••••••")
                    .autocorrectionDisabled()
                    .fixedSize()
                    .font(.title2)
                    .foregroundStyle(Color.appGreen)
                    .bold(bold)
                    
                
                Capsule()
                    .frame(height: 2)
                
            }
        }
    }
    
    func loadDemo() {
        email = "slug@ucsc.edu"
        bold = true
        
        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            isAnimating.toggle()
        }
    }
    
    var headerText: some View {
        VStack(spacing: 32) {
            Text("Load Demo")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundStyle(Color.appGreen)
                .bold()
                .onTapGesture {
                    loadDemo()
                }
            Text("Sign up")
                .fontWeight(.bold)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 48)
        }
    }
    
    var tos: some View {
        ZStack {
            Text("Don't have an account? ")
            +
            Text("Sign Up!")
                .underline()
        }
        .font(.caption)
        .frame(maxWidth: .infinity, alignment: .center)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    OnboardingView()
}
