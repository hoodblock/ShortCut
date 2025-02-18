//
//  Color+Extension.swift
//  B101
//
//  Created by Thomas on 2025/1/9.
//

import SwiftUI

public extension Color {
    
   
    static let Color_B1875B: Color = Color(hexColor(color: 0xFFB1875B))
    static let String_Color_B1875B: String = "0xFFB1875B"
    
    
    static func hexColor(color: Int) -> Color {
        let opacity = Float.init(((color & 0xFF000000) >> 24)) / 255.0
        let redComponent = Float.init(((color & 0x00FF0000) >> 16)) / 255.0
        let greenComponent = Float.init(((color & 0x0000FF00) >> 8)) / 255.0
        let blueComponent = Float.init(((color & 0x000000FF))) / 255.0
        return Color(UIColor.init(red: CGFloat.init(Float.init(redComponent)), green: CGFloat.init(Float.init(greenComponent)), blue: CGFloat.init(Float.init(blueComponent)), alpha: CGFloat.init(Float.init(opacity))))
   }

    static func hexColor(color: Int) -> UIColor {
        let opacity = Float.init(((color & 0xFF000000) >> 24)) / 255.0
        let redComponent = Float.init(((color & 0x00FF0000) >> 16)) / 255.0
        let greenComponent = Float.init(((color & 0x0000FF00) >> 8)) / 255.0
        let blueComponent = Float.init(((color & 0x000000FF))) / 255.0
        return UIColor.init(red: CGFloat.init(Float.init(redComponent)), green: CGFloat.init(Float.init(greenComponent)), blue: CGFloat.init(Float.init(blueComponent)), alpha: CGFloat.init(Float.init(opacity)))
   }

    static func stringColor(color: Int) -> String {
        let colorString = String(format: "%06X", color)
        return colorString
    }

    static func color(hexString: String) -> Color {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        if Scanner(string: hexSanitized).scanHexInt64(&rgb) {
            let opacity = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            let red = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            let green = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            let blue = CGFloat((rgb & 0x000000FF)) / 255.0
            return Color(UIColor.init(red: CGFloat.init(red), green: CGFloat.init(green), blue: CGFloat.init(blue), alpha: CGFloat.init(opacity)))
        } else {
            return Color.clear
        }
    }
    
    static func color(hexString: String) -> UIColor {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        if Scanner(string: hexSanitized).scanHexInt64(&rgb) {
            let opacity = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            let red = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            let green = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            let blue = CGFloat((rgb & 0x000000FF)) / 255.0
            return UIColor.init(red: CGFloat.init(red), green: CGFloat.init(green), blue: CGFloat.init(blue), alpha: CGFloat.init(opacity))
        } else {
            // Return a default color if unable to parse the hex string
            return UIColor.clear
        }
    }
    
    var hexString: String {
        let components = self.cgColor?.components ?? [0, 0, 0]
        let red = Int(components[0] * 255)
        let green = Int(components[1] * 255)
        let blue = Int(components[2] * 255)
        return String(format: "#%02X%02X%02X", red, green, blue)
    }
    
}

public extension UIColor {
    
    static let Color_3C4500: UIColor = (hexColor(color: 0xFF3C4500))
    static let String_Color_3C4500: String = "0xFF3C4500"
    
    static func hexColor(color: Int, _ alpha: CGFloat = 1.0) -> UIColor {
        let opacity = Float.init(((color & 0xFF000000) >> 24)) / 255.0
        let redComponent = Float.init(((color & 0x00FF0000) >> 16)) / 255.0
        let greenComponent = Float.init(((color & 0x0000FF00) >> 8)) / 255.0
        let blueComponent = Float.init(((color & 0x000000FF))) / 255.0
        return UIColor.init(red: CGFloat.init(Float.init(redComponent)), green: CGFloat.init(Float.init(greenComponent)), blue: CGFloat.init(Float.init(blueComponent)), alpha: CGFloat.init(Float.init(opacity)))
    }

}
