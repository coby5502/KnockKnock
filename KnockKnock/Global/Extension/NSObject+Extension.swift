//
//  NSObject+Extension.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
