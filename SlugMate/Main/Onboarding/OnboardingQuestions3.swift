//
//  OnboardingQuestions3.swift
//  SlugMate
//
//  Created by Charlie Reeder on 5/17/25.
//

import SwiftUI

struct OnboardingQuestions3: View {
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ctaButton(text: "Next") {
                    Text("S")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingQuestions3()
    }
    
}
