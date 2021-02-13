//
//  ContentView.swift
//  DayBridge
//
//  Created by Paul Jackson on 11/02/2021.
//

import SwiftUI

struct ContentView: View {

    var morningGradient: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.blue.opacity(0.6),
                        Color.red.opacity(0.4)]),
                startPoint: .leading,
                endPoint: .trailing
            )

            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.white.opacity(0.6),
                        Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }

    var eveningGradient: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.purple.opacity(0.2),
                        Color.red.opacity(0.6)]),
                startPoint: .leading,
                endPoint: .trailing
            )

            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.white.opacity(0.6),
                        Color.white]),
                startPoint: .bottom,
                endPoint: .top
            )
        }
    }

    var dayHeader: some View {
        HStack {
            Text("Monday")
                .bold()
                .textCase(.uppercase)
            Text("7 September")
            Spacer()
            Image(systemName: "list.bullet")
                .padding(6)
                .background(
                    Circle()
                        .foregroundColor(Color.black.opacity(0.1))
                        .frame(width: 24, height: 24, alignment: .center)
                )
                .foregroundColor(Color.black.opacity(0.5))
        }
        .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
        .font(.caption)
        .foregroundColor(Color.black.opacity(0.6))
    }

    var wakeUp: some View {
        HStack {
            Text("8:00 AM")
                .padding(.trailing, -10)
            Image(systemName: "sun.haze")
                .padding(.leading)
            Text("Wake up")
            Spacer()
        }
        .foregroundColor(.blue)
        .font(.footnote)
        .padding()
        .background(morningGradient)
        .padding(.top, -8)
    }

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
        .background(eveningGradient)
    }

    var body: some View {
        VStack(alignment: .leading) {
            dayHeader

            ScrollView {
                wakeUp

                VStack(spacing: 20) {
                    Group {
                        BlockedOutView(
                            title: "Get ready",
                            startTime: "8:00 AM", endTime: "9:00 AM", duration: "1h",
                            image: "sun.haze"
                        )

                        ActivityView(title: "Starting work", time: "10:00AM")

                        BlockedOutView(
                            title: "Lunch with the team",
                            startTime: "12:00 AM", endTime: "1:00 PM", duration: "1h",
                            color: Color.blue,
                            background: .white
                        )
                        .shadow(radius: 1)

                        ActivityView(title: "Finishing work", time: "6:00 PM")
                    }

                    Group {
                        BlockedOutLineView(
                            title: "Underground",
                            startTime: "6:10 PM",
                            image: "tram.fill",
                            isHatched: true
                        )

                        BlockedOutLineView(
                            title: "Arrive 10m before",
                            startTime: "6:30 PM",
                            image: "clock.fill"
                        )

                        BlockedOutView(
                            title: "Hair cut",
                            startTime: "6:40 PM", endTime: "7:40 PM", duration: "1h",
                            location: "Covent Garden",
                            image: "scissors",
                            color: Color.orange,
                            background: Color.white
                        )
                        .shadow(radius: 1)
                        .padding(.top, -28)

                        BlockedOutLineView(
                            title: "Underground",
                            startTime: "6:10 PM",
                            image: "tram.fill",
                            isHatched: true
                        )
                    }

                    Group {
                        TaskView(title: "Pickup groceries on the way back")

                        BlockedOutLineView(
                            title: "Underground",
                            startTime: "8:00 PM",
                            image: "tram.fill",
                            isHatched: true
                        )
                    }


                    Spacer()
                }

                goToSleep
                    .padding(.top, 40)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ActivityView: View {
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
        .padding([.leading, .trailing], 20)
        .padding([.top, .bottom], 4)
        .font(.caption)
        .background(Color.blue.opacity(0.2))
        .foregroundColor(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .frame(width: 240, height: nil, alignment: .center)
    }
}

struct TaskView: View {
    var title: String

    var body: some View {
        VStack {
            Toggle(
                isOn: .constant(false),
                label: {
                    Text(title)
                }
            )
            .font(.caption)
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black.opacity(0.2), lineWidth: 1)
        )
        .padding([.leading, .trailing])
    }
}

struct BlockedOutLineView: View {
    var title: String
    var startTime: String
    var image: String
    var color: Color? = Color.black.opacity(0.3)
    var background: Color? = Color.gray.opacity(0.1)
    var isHatched: Bool = false

    @ViewBuilder
    var hatchedBackground: some View {
        if isHatched {
            Lines(
                config: LinesConfig(
                    background: Color.clear,
                    foreground: Color.black.opacity(0.1),
                    lineWidth: 8.0,
                    lineSpacing: 5.0,
                    degrees: 45
                )
            )
        } else {
            EmptyView()
        }
    }


    var body: some View {
        VStack {
            HStack {
                Text(startTime)
                    .foregroundColor(Color.black.opacity(0.8))
                    .font(.custom("system", size: 14))
                Text(title)
                    .foregroundColor(Color.black.opacity(0.6))
                    .font(.custom("system", size: 14))

                Spacer()

                Image(systemName: image)
                    .padding(6)
                    .background(
                        Circle()
                            .foregroundColor(color)
                            .frame(width: 32, height: 32, alignment: .center)
                    )
                    .foregroundColor(.white)
            }
            .padding([.top, .bottom], 6)
            .padding(.leading, 24)
            .padding(.trailing, 20)
            .foregroundColor(color)
            .background(background)
            .overlay(
                HStack {
                    Rectangle()
                        .frame(width: 10)
                        .foregroundColor(color)
                        .background(hatchedBackground)
                    Spacer()
                }
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .padding([.leading, .trailing])
    }
}

struct BlockedOutView: View {
    var title: String
    var startTime: String
    var endTime: String
    var duration: String
    var location: String?
    var image: String?
    var color: Color? = Color.black.opacity(0.3)
    var background: Color? = Color.gray.opacity(0.1)

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(Color.black.opacity(0.8))
                        .font(.custom("system", size: 14))
                    HStack {
                        Text(startTime)
                        Image(systemName: "arrow.right")
                        Text(endTime)
                        Text(duration)
                            .font(.caption)
                    }
                    .font(.custom("system", size: 14))
                    .foregroundColor(.secondary)


                    if let location = location {
                        HStack {
                            Image(systemName: "location.fill")
                            Text(location)
                                .font(.caption)
                        }
                        .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
                        .foregroundColor(.secondary)
                        .background(Color.gray.opacity(0.1))
                        .foregroundColor(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0))
                        .padding([.top, .leading], 4)
                    }
                }

                Spacer()

                if let image = image {
                    Image(systemName: image)
                        .padding(6)
                        .background(
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 32, height: 32, alignment: .center)
                        )
                        .foregroundColor(.white)
                } else {
                    HStack() {
                        Circle()
                            .foregroundColor(color)
                            .frame(width: 32, height: 32, alignment: .center)
                            .offset(x: 32.0)
                        Circle()
                            .foregroundColor(color!.opacity(0.8))
                            .frame(width: 32, height: 32, alignment: .center)
                            .offset(x: 16.0)
                        Circle()
                            .foregroundColor(color!.opacity(0.6))
                            .frame(width: 32, height: 32, alignment: .center)
                    }
                }
            }
            .padding()
            .padding(.leading, 10)
            .foregroundColor(color)
            .background(background)
            .overlay(
                HStack {
                    Rectangle()
                        .frame(width: 10)
                        .foregroundColor(color)
                    Spacer()
                }
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .padding([.leading, .trailing])
    }
}
