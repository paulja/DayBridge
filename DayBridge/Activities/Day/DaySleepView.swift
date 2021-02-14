//
//  DaySleepView.swift
//  DayBridge
//
//  Created by Paul Jackson on 14/02/2021.
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


struct DaySleepView: View {
    var body: some View {
        ZStack {
            HStack {
                Text("11:00 PM")
                    .padding(.trailing, -10)
                Image(systemName: "moon.zzz.fill")
                    .padding(.leading)
                Text("Go to sleep")
                Spacer()
            }.offset(y: -16)
        }
        .foregroundColor(.appPurple)
        .font(.footnote)
        .padding()
        .background(EveningGradient())
    }
}

struct DaySleepView_Previews: PreviewProvider {
    static var previews: some View {
        DaySleepView()
    }
}
