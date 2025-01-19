//
//  StepView.swift
//  simple-onboarding
//
//  Created by Ivan Lé Hjelmeland on 16/01/2025.
//

import SwiftUI

struct StepView: View {
    
    let title: String
    let subtitle: String
    let buttonTitle: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 32)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            Text(subtitle)
                .font(.body)
                .padding(.bottom, 32)
            Button(buttonTitle, action: action)
                .myButtonStyle()
                .padding(.horizontal, 64)
                .padding(.bottom, 64)
        }
    }
}

extension View {
    func myButtonStyle() -> some View {
        buttonStyle(MyButtonStyle())
    }
}

#Preview {
    StepView(title: "Test", subtitle: "Test", buttonTitle: "Next", image: "2") {
        print("lol")
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(Color.blue)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .clipShape(.rect(cornerRadius: 8))
    }
}
