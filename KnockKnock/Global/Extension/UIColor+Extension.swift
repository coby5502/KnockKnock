//
//  UIColor+Extension.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit

extension UIColor {
    
    // MARK: - blue

    static var mainBlue: UIColor {
        return UIColor(hex: "#005073")
    }

    static var blue001: UIColor {
        return UIColor(hex: "#107DAC")
    }
    
    static var blue002: UIColor {
        return UIColor(hex: "#189AD3")
    }
    
    static var blue003: UIColor {
        return UIColor(hex: "#1EBBD7")
    }
    
    static var blue004: UIColor {
        return UIColor(hex: "#71C7EC")
    }

    // MARK: - red

    static var mainRed: UIColor {
        return UIColor(hex: "#E13B2D")
    }

    static var shadowRed: UIColor {
        return UIColor(hex: "#A4291F")
    }

    static var red001: UIColor {
        return UIColor(hex: "#C84842")
    }

    static var red002: UIColor {
        return UIColor(hex: "#823029")
    }

    // MARK: - background

    static var backgroundGrey: UIColor {
        return UIColor(hex: "#242424")
    }

    // MARK: - grey

    static var grey001: UIColor {
        return UIColor(hex: "#D9D9D9")
    }

    static var grey002: UIColor {
        return UIColor(hex: "#A5A5A5")
    }

    static var grey003: UIColor {
        return UIColor(hex: "#828282")
    }

    static var grey004: UIColor {
        return UIColor(hex: "#717174")
    }

    // MARK: - darkGrey

    static var darkGrey001: UIColor {
        return UIColor(hex: "#616161")
    }

    static var darkGrey002: UIColor {
        return UIColor(hex: "#5A5A5A")
    }

    static var darkGrey003: UIColor {
        return UIColor(hex: "#3D3D3D")
    }

    static var darkGrey004: UIColor {
        return UIColor(hex: "#343434")
    }

    // MARK: - orange

    static var subOrange: UIColor {
        return UIColor(hex: "#EAB33D")
    }

    // MARK: - yellow
    
    static var yellow: UIColor {
        return UIColor(hex: "#EDC845")
    }
    
    static var shadowYellow: UIColor {
        return UIColor(hex: "#C7A83C")
    }
    
    // MARK: - badge

    static var badgeBeige: UIColor {
        return UIColor(hex: "#FFDBBA")
    }

    // MARK: - character

    static var characterYellow: UIColor {
        return UIColor(hex: "#EFDC4A")
    }

    static var characterRed: UIColor {
        return UIColor(hex: "#D03D40")
    }

    static var characterOrange: UIColor {
        return UIColor(hex: "#D78041")
    }

    static var characterBlue: UIColor {
        return UIColor(hex: "#0811CD")
    }

    static var characterLightGreen: UIColor {
        return UIColor(hex: "#8AB542")
    }

    static var characterPurple: UIColor {
        return UIColor(hex: "#8B3183")
    }

    static var characterGreen: UIColor {
        return UIColor(hex: "#43844E")
    }

    static var characterPink: UIColor {
        return UIColor(hex: "#E46593")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
