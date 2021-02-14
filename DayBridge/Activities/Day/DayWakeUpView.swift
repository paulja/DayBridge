//
//  DayWakeUpView.swift
//  DayBridge
//
//  Created by Paul Jackson on 14/02/2021.
//

import SwiftUI

struct MorningGradient: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.blue.opacity(0.6),
                        Color.red.opacity(0.4)
                    ]),
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

struct DayWakeUpView: View {
    var body: some View {
        HStack {
            Text("8:00 AM")
                .padding(.trailing, -10)
            Image(systemName: "sun.haze")
                .padding(.leading)
            Text("Wake up")
            Spacer()
        }
        .foregroundColor(.appBlue)
        .font(.footnote)
        .padding()
        .background(MorningGradient())
        .padding(.top, -8)
    }
}

struct MorningView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DayWakeUpView()
            Spacer()
        }
    }
}
