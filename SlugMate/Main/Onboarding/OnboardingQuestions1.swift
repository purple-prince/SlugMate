//
//  OnboardingQuestions1.swift
//  SlugMate
//
//  Created by Charlie Reeder on 5/17/25.
//

import SwiftUI

struct OnboardingQuestions1: View {
        
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            VStack {
                screen1
                
                Spacer()
                
                bottomButton
            }
        }
        .animation(.smooth)
    }
    
    var bottomButton: some View {
        
        ctaButton(text: "Let's go!") {
            OnboardingQuestions2()
                .navigationBarBackButtonHidden()
        }
        
        
    }
    
    var screen1: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Housing is hard.")
                .font(.largeTitle)
                .bold()
            
            Text("But you aren't alone.")
                .font(.title2)
                .foregroundStyle(Color.appGreen)
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text("Answer a few questions to match you to a roomate.")
                .multilineTextAlignment(.center)
                .padding(.top, 150)
                .font(.title)
            
            Spacer()

        }
        .foregroundStyle(Color.appBlack)
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal)
        .padding(.top, 100)
    }
}

#Preview {
    NavigationStack {
        OnboardingQuestions1()
    }
    
}
