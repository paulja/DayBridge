//
//  DayActivityView.swift
//  DayBridge
//
//  Created by Paul Jackson on 14/02/2021.
//

import SwiftUI

struct DayActivityView: View {
    var title: String
    var time: String

    var body: some View {
        HStack {
            Text(time)
                .bold()
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(EdgeInsets(top: 4, leading: 20, bottom: 4, trailing: 20))
        .font(.caption)
        .background(Color.appLightBlue)
        .foregroundColor(.appBlue)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .frame(width: 240, height: nil, alignment: .center)
    }
}

struct DayActivityView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DayActivityView(title: "Starting work", time: "10:00 AM")
            Spacer()
        }
    }
}
