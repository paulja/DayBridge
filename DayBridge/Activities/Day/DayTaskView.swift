//
//  DayTaskView.swift
//  DayBridge
//
//  Created by Paul Jackson on 14/02/2021.
//

import SwiftUI

struct DayTaskView: View {
    var title: String

    var body: some View {
        VStack {
            Toggle(
                isOn: .constant(false),
                label: {
                    Text(title)
                        .textStyle(NormalTextStyle())
                }
            )
            .font(.caption)
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.appMediumBackground, lineWidth: 1)
        )
        .padding([.leading, .trailing])
    }}

struct DayTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DayTaskView(title: "Get shopping on the way home")
    }
}
