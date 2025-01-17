//
//  ContentView.swift
//  simple-onboarding
//
//  Created by Ivan Lé Hjelmeland on 16/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    private enum Steps {
        case first
        case second
        case third
    }
    
    @State private var index = Steps.first
    @State private var onboardingComplete = false
    
    var body: some View {
        
        if onboardingComplete {
            WelcomeView()
                .ignoresSafeArea()
                .transition(.opacity)
        } else {
            TabView(selection: $index) {
                
                StepView(title: "First", subtitle: "Hello 1", buttonTitle: "Next", image: "1") {
                    index = .second
                }
                .tag(Steps.first)
                
                StepView(title: "Second", subtitle: "Hello 2", buttonTitle: "Next", image: "2") {
                    index = .third
                }
                .tag(Steps.second)
                
                StepView(title: "Third", subtitle: "Hello 3", buttonTitle: "Finish", image: "3") {
                    onboardingComplete = true
                }
                .tag(Steps.third)
                
            }
            .animation(.default, value: index)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

#Preview {
    ContentView()
}
