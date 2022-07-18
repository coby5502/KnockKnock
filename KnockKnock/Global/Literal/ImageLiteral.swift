//
//  ImageLiteral.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit

enum ImageLiterals {
    
    // MARK: - button
    
    static var btnBack: UIImage { .load(systemName: "chevron.backward") }
    static var btnSetting: UIImage { .load(systemName: "gearshape") }
    static var btnPlus: UIImage { .load(systemName: "plus") }
    static var alarmOn: UIImage { .load(name: "alarm_on") }
    static var alarmOff: UIImage { .load(name: "alarm_off") }
  
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
