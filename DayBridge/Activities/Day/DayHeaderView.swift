//
//  DayHeaderView.swift
//  DayBridge
//
//  Created by Paul Jackson on 14/02/2021.
//

import SwiftUI

struct DayHeaderView: View {
    var day, date: String
    
    var body: some View {
        HStack {
            Text(day)
                .textStyle(NormalBoldTextStyle())
                .textCase(.uppercase)
            Text(date)
                .textStyle(NormalTextStyle())
            Spacer()
            Image(systemName: "list.bullet")
                .padding(6)
                .background(
                    Circle()
                        .foregroundColor(.appMediumBackground)
                        .frame(width: 30, height: 30, alignment: .center)
                )
                .foregroundColor(.appDarkBackground)
        }
        .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
    }
}

struct DayHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DayHeaderView(day: "Tuesday", date: "26 January")
            Spacer()
        }
    }
}
