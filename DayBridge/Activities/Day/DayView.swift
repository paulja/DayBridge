//
//  DayView.swift
//  DayBridge
//
//  Created by Paul Jackson on 13/02/2021.
//

import SwiftUI

struct DayView: View {
    var goToSleep: some View {
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
        .foregroundColor(.purple)
        .font(.footnote)
        .padding()
        .background(EveningGradient())
    }

    var body: some View {
        VStack(alignment: .leading) {
            DayHeaderView(day: "Monday", date: "7 Septmeber")

            ScrollView {
                DayWakeUpView()

                VStack(spacing: 20) {
                    Group {
                        DayBlockOutView(
                            title: "Get ready",
                            image: "sun.haze",
                            startTime: "8:00 AM",
                            endTime: "9:00 AM",
                            duration: "1h"
                        )

                        DayActivityView(
                            title: "Starting work",
                            time: "10:00AM")

                        DayBlockOutView(
                            title: "Lunch with the team",
                            image: "faces",
                            startTime: "12:00 AM", endTime: "1:00 PM", duration: "1h",
                            color: .appBlue,
                            backgroundColor: .appUltraLightBackground
                        )
                        .shadow(radius: 1)
                        
                        DayActivityView(
                            title: "Finishing work",
                            time: "6:00 PM")
                    }

                    Group {
                        DayBlockOutView(
                            title: "Underground",
                            image: "tram.fill",
                            startTime: "6:10 PM",
                            disconnected: true
                        )

                        DayBlockOutView(
                            title: "Arrive 10m before",
                            image: "clock.fill",
                            startTime: "6:30 PM"
                        )

                        DayBlockOutView(
                            title: "Hair cut",
                            image: "scissors",
                            startTime: "6:40 PM", endTime: "7:40 PM", duration: "1h",
                            color: .appDarkOrange,
                            backgroundColor: .appUltraLightBackground,
                            location: "Covent Garden"
                        )
                        .shadow(radius: 1)
                        .padding(.top, -28)

                        DayTaskView(title: "Pickup groceries on the way back")
                        
                        DayBlockOutView(
                            title: "Underground",
                            image: "tram.fill",
                            startTime: "8:00 PM",
                            disconnected: true
                        )
                    }

                    Spacer()
                }

                DaySleepView()
                    .padding(.top, 40)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
