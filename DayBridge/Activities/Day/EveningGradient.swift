//
//  EveningGradient.swift
//  DayBridge
//
//  Created by Paul Jackson on 13/02/2021.
//

import SwiftUI

struct EveningGradient: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.purple.opacity(0.2),
                        Color.red.opacity(0.6)]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .mask (
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.white.opacity(0.6),
                            Color.clear]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
        }
    }
}

struct EveningGradient_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Scroll down to see gradient preview...")
                .font(.caption)
                .italic()
                .foregroundColor(.secondary)
                .padding(.top, 100)
            Spacer()
            EveningGradient()
                .frame(height: 100)
        }
        .ignoresSafeArea()
    }
}
