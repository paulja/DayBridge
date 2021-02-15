//
//  Lines.swift
//  DayBridge
//
//  Created by Paul Jackson on 12/02/2021.
//

import SwiftUI

struct LinesConfig {
    var background, foreground: Color
    var lineWidth, lineSpacing: CGFloat
    var angle: Double

    public init(
        background: Color = Color.black.opacity(0.5),
        foreground: Color = Color.black.opacity(0.8),
        lineWidth: CGFloat = 20,
        lineSpacing: CGFloat = 20,
        angle: Double = 45) {

        self.background = background
        self.foreground = foreground
        self.lineWidth = lineWidth
        self.lineSpacing = lineSpacing
        self.angle = angle
    }
}

struct Lines: View {
    var config: LinesConfig

    public init(config: LinesConfig) {
        self.config = config
    }

    public var body: some View {
        GeometryReader { proxy in
            let stride = config.lineWidth + config.lineSpacing
            let size = max(proxy.size.width, proxy.size.height)
            let count = Int(2 * size / stride)

            HStack(spacing: config.lineSpacing) {
                ForEach(0..<count) { _ in
                    config.foreground
                        .frame(width: config.lineWidth, height: 2 * size)
                }
            }
            .background(config.background)
            .rotationEffect(Angle(degrees: config.angle), anchor: .center)
            .offset(x: -size / 2, y: -size / 2)
        }
        .clipped()
    }
}

struct Stripes_Previews: PreviewProvider {
    static var previews: some View {
        Lines(config: LinesConfig())
    }
}
