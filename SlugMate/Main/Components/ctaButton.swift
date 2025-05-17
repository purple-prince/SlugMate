//
//  ctaButton.swift
//  SlugMate
//
//  Created by Charlie Reeder on 5/17/25.
//

import SwiftUI

struct ctaButton<Destination: View>: View {
    
    let text: String
    @ViewBuilder var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
                .bold()
                .foregroundStyle(Color.appBackground)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.appBlack)
                .clipShape(Capsule())
                .shadow(radius: 6, x: 0, y: 4)
                .padding(.horizontal, 4)
                .padding(.horizontal)
        }
    }
}

#Preview {
    NavigationStack {
        ctaButton(text: "SS") {
            Text("ss")
        }
    }
}
