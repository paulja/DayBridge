//
//  Text+Helpers.swift
//  DayBridge
//
//  Created by Paul Jackson on 13/02/2021.
//

import SwiftUI

extension Text {
    func textStyle(_ style: TextStyle) -> Text {
        var text = self
        text = text.foregroundColor(style.color)
        text = text.font(style.font)
        return text
    }
}
