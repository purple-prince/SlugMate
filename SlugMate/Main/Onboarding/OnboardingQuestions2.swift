//
//  OnboardingQuestions2.swift
//  SlugMate
//
//  Created by Charlie Reeder on 5/17/25.
//

import SwiftUI

struct OnboardingQuestionView<Content: View>: View {
    
    let title: String
    let appStorageKey: String
    let options: [String]
    let nextDestination: Content
    let buttonText: String
        
    @AppStorage var selectedOption: String
    
    init(title: String, appStorageKey: String, options: [String], selectedOption: String = "", buttonText: String = "Next", nextDestination: Content) {
        self.title = title
        self.appStorageKey = appStorageKey
        self.options = options
        self._selectedOption = AppStorage(wrappedValue: "", appStorageKey)
        self.nextDestination = nextDestination
        self.buttonText = buttonText
    }
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            VStack(spacing: 50) {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.appBlack)
                    .multilineTextAlignment(.center)
                    .padding(.top, 100)
                
                VStack(spacing: 12) {
                    ForEach(options, id: \.self) { option in
                        optionButton(text: option)
                    }
                }
                
                Spacer()
                
                ctaButton(text: buttonText) {
                    nextDestination
                }
                .onAppear {
                    selectedOption = ""
                }
                .opacity(selectedOption == "" ? 0.6 : 1.0)
            }
        }
    }
    
    @ViewBuilder func optionButton(text: String) -> some View {
        
        HStack {
            Text(text)
            
            Spacer()
            
            ZStack {
                
                Circle()
                    .fill(Color.blue.opacity(0.001))
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 18)
                
                Circle()
                    .stroke(Color.appBlack.opacity(0.5))
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 18)
                
                if selectedOption == text {
                    Circle()
                        .fill(Color.appGreen)
                        .brightness(-0.2)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 18)
                }

            }
            .onTapGesture {
                selectedOption = text
            }
        }
        .padding()
        .foregroundStyle(Color.appBlack)
        .frame(maxWidth: .infinity)
        .background { Color.appGreen.opacity(0.3) }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
    }
}

struct OnboardingQuestions2: View {
    
    var body: some View {
        ZStack {
            OnboardingQuestionView(
                title: "Where are you going to live?",
                appStorageKey: "livingPlace",
                options: ["On Campus", "Off Campus", "I'm Flexible"],
                nextDestination: onboardingQuestions3
            )
        }
    }
    
    var onboardingQuestions3: some View {
        OnboardingQuestionView(
            title: "How many roomates are you looking for?",
            appStorageKey: "numRoomates",
            options: ["One", "Two", "Three", "Four", "Five or More"],
            nextDestination: onboardingQuestions4
        )
        .navigationBarBackButtonHidden()
    }
    
    var onboardingQuestions4: some View {
        OnboardingQuestionView(
            title: "When do you usually go to bed?",
            appStorageKey: "bedtime",
            options: [
                "👶 9pm or earlier",
                "🥱 10pm",
                "🛌 11pm",
                "😴 12am",
                "😳 1am",
                "☀️ 2am or later"
            ],
            nextDestination: onboardingQuestions5
        )
        .navigationBarBackButtonHidden()
    }
    
    var onboardingQuestions5: some View {
        OnboardingQuestionView(
            title: "Last one... How do you keep your space?",
            appStorageKey: "cleanPref",
            options: [
                "🤷 Messy",
                "👍 Organized",
                "🧼 Clean Freak"
            ],
            buttonText: "Finish",
            nextDestination: ContentView()
        )
        .navigationBarBackButtonHidden()
    }

}

#Preview {
    NavigationStack {
        OnboardingQuestions2()
    }
}
