//
//  WelcomeView.swift
//  SlugMate
//
//  Created by Charlie Reeder on 5/17/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var scaled: Bool = true
    @State var showButton: Bool = false
    @State var getStartedPressed: Bool = false
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground.ignoresSafeArea()
                            
                main
            }
            .animation(.smooth(duration: 1.0), value: showButton)
            .onAppear { onViewAppeared() }
            .frame(maxHeight: .infinity)
        }
//        .tint(.appGreen)
    }
    
    var main: some View {
        ZStack {
            VStack(spacing: 0) {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: scaled ? 400 : 175)

                VStack(spacing: 20) {
                    Text("SlugMate")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Find your perfect slug roomate")
                }
                .opacity(scaled ? 0.0001 : 1.0)
                .padding(.top, 32)
                
                
                Spacer()
                
                getStartedButton
            }
            .padding(.top)
        }
    }
    
    var getStartedButton: some View {
        NavigationLink(
            destination: OnboardingQuestions1()
                .navigationBarBackButtonHidden()
        ) {
            Text("Get Started")
                .bold()
                .foregroundStyle(Color.appBackground)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.appBlack)
                .clipShape(Capsule())
                .shadow(radius: 6, x: 0, y: 4)
                .padding(.horizontal, 4)
                .opacity(showButton ? 1.0 : 0.001)
                .transition(.opacity)
            }
            .padding(.horizontal, 32)
    }
    
    func onViewAppeared() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.smooth(duration: 1.5)) { scaled = false }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            showButton = true
        }
    }
}

#Preview {
    WelcomeView()
}
