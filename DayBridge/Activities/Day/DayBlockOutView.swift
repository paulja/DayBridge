//
//  DayBlockOutView.swift
//  DayBridge
//
//  Created by Paul Jackson on 14/02/2021.
//

import SwiftUI

struct DayBlockOutView: View {
    var title: String
    var image: String
    var startTime: String
    var endTime: String?
    var duration: String?
    var color: Color = .appDarkBackground
    var backgroundColor: Color?
    var location: String?
    var disconnected: Bool? = false
        
    @ViewBuilder
    var disconnectedView: some View {
        if disconnected == true {
            Lines(
                config: LinesConfig(
                    background: .clear,
                    foreground: Color.appMediumBackground,
                    lineWidth: 5.0,
                    lineSpacing: 5.0,
                    angle: 45
                )
            )
        } else {
            EmptyView()
        }
    }
    
    var facesView: some View {
        HStack() {
            Circle()
                .foregroundColor(color)
                .frame(width: 32, height: 32, alignment: .center)
                .offset(x: 32.0)
            Circle()
                .foregroundColor(color.opacity(0.8))
                .frame(width: 32, height: 32, alignment: .center)
                .offset(x: 16.0)
            Circle()
                .foregroundColor(color.opacity(0.6))
                .frame(width: 32, height: 32, alignment: .center)
        }
    }
    
    @ViewBuilder
    var itemDetailsView: some View {
        if endTime == nil {
            Text(startTime)
                .textStyle(NormalBoldTextStyle())
            Text(title)
                .textStyle(NormalTextStyle())
        } else {
            VStack(alignment: .leading) {
                Text(title)
                    .textStyle(NormalBoldTextStyle())
                HStack {
                    Text(startTime)
                        .textStyle(NormalTextStyle())
                    Image(systemName: "arrow.right")
                        .foregroundColor(TextStyleDefaults.color)
                        .font(.caption)
                    Text(endTime!)
                        .textStyle(NormalTextStyle())
                    Text(duration ?? "")
                        .font(.caption)
                        .foregroundColor(TextStyleDefaults.color)
                }
            }
        }
    }

    @ViewBuilder
    var itemImageView: some View {
        if image == "faces" {
            facesView
        } else {
            Image(systemName: image)
                .padding(6)
                .background(
                    Circle()
                        .foregroundColor(color)
                        .frame(width: 32, height: 32, alignment: .center)
                )
                .foregroundColor(.white)
        }
    }
    
    @ViewBuilder
    var locationView: some View {
        if let location = location {
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.appDarkBackground)
                Text(location)
                    .foregroundColor(.appDarkBackground)
            }
            .font(.caption)
            .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
            .foregroundColor(.appDarkBackground)
            .background(Color.appMediumBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .padding(.leading, 20)
        } else {
            EmptyView()
        }
    }
    
    var sideBarView: some View {
        HStack {
            Rectangle()
                .frame(width: 10)
                .foregroundColor(color)
                .overlay(disconnectedView)
            Spacer()
        }
    }
    
    var viewAlignment: VerticalAlignment {
        endTime == nil ? .center : .top
    }
    
    var viewBackground: Color {
        backgroundColor != nil ? backgroundColor! : .appLightBackground
    }
        
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack(alignment: viewAlignment) {
                    itemDetailsView
                    Spacer()
                    itemImageView
                }
                locationView
            }
            .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 20))
            .background(viewBackground)
            .overlay(sideBarView)
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .padding([.leading, .trailing])
    }
}

struct BlockOutView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DayBlockOutView(
                title: "Get ready",
                image: "sun.haze",
                startTime: "8:00 AM",
                endTime: "9:00 AM",
                duration: "1h"
            )
            
            DayBlockOutView(
                title: "Underground",
                image: "tram.fill",
                startTime: "11:30 AM",
                disconnected: true
            )
            
            DayBlockOutView(
                title: "Haircut",
                image: "scissors",
                startTime: "6:40 PM",
                endTime: "7:20 PM",
                color: .appOrange,
                backgroundColor: .appUltraLightBackground,
                location: "Covent Garden"
            )
            .shadow(radius: 1)
            
            DayBlockOutView(
                title: "Car service",
                image: "car",
                startTime: "9:40 PM",
                endTime: "10:20 PM",
                color: .appRed,
                backgroundColor: .appUltraLightBackground
            )
            .shadow(radius: 1)
            
            DayBlockOutView(
                title: "Lunch with the team",
                image: "faces",
                startTime: "10:40 PM",
                endTime: "11:30 PM",
                color: .appBlue,
                backgroundColor: .appUltraLightBackground
            )
            .shadow(radius: 1)
            
            Spacer()
        }
    }
}
