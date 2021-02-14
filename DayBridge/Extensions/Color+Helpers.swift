//
//  Color+Helpers.swift
//  DayBridge
//
//  Created by Paul Jackson on 13/02/2021.
//

import SwiftUI

extension Color {
    
    // MARK: - Application Colours -
    
    /// Application Blue
    public static var appBlue: Color { Color("AppBlue") }
    /// Application Dark Orange
    public static var appDarkOrange: Color { Color("AppDarkOrange") }
    /// Application Light Blue
    public static var appLightBlue: Color { Color("AppLightBlue") }
    /// Application Orange
    public static var appOrange: Color { Color("AppOrange") }
    /// Application Purple
    public static var appPurple: Color { Color("AppPurple") }
    /// Application Red
    public static var appRed: Color { Color("AppRed") }
    
    // MARK: - Backgrounds -

    /// Color used for tile backgrounds.
    public static var appLightBackground: Color { Color("BackgroundLightColor")  }
    /// Color used to light tile backgrounds.
    public static var appUltraLightBackground: Color { Color("BackgroundUltraLightColor")  }
    /// Color used for toolbar button backgrounds.
    public static var appMediumBackground: Color { Color("BackgroundMediumColor")  }
    /// Color used for tile icon backgrounds.
    public static var appDarkBackground: Color { Color("BackgroundDarkColor")  }
    
    // MARK: - Text -
    
    /// Color used for normal text.
    public static var textColor: Color { Color("TextColor")  }
}
