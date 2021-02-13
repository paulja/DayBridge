//
//  TextStyle.swift
//  DayBridge
//
//  Created by Paul Jackson on 13/02/2021.
//

import SwiftUI

protocol TextStyle {
    var color: Color? { get }
    var font: Font? { get }
}

struct TextStyleDefaults {
    static let color: Color = Color.textColor
    static let font: Font = .system(size: 14.0, weight: .regular)
    static let boldFont: Font = .system(size: 14.0, weight: .medium)

}

struct NormalTextStyle: TextStyle {
    var color: Color? { TextStyleDefaults.color }
    var font: Font? { TextStyleDefaults.font }
}

struct NormalBoldTextStyle: TextStyle {
    var color: Color? { TextStyleDefaults.color }
    var font: Font? { TextStyleDefaults.boldFont }
}
