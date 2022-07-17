//
//  UIFont+Extension.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit

enum FontName: String {
    case regular = "DungGeunMo"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
