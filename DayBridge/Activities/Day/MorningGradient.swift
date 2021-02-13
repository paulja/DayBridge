//
//  MorningGradient.swift
//  DayBridge
//
//  Created by Paul Jackson on 13/02/2021.
//

import SwiftUI

struct MorningGradient: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.blue.opacity(0.6),
                        Color.red.opacity(0.4)]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .mask(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.white.opacity(0.6),
                            Color.clear
                        ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

struct MorningGradient_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MorningGradient()
                .frame(height: 100)
            Spacer()
        }
        .ignoresSafeArea()
    }
}
