//
//  Alarm.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import Foundation

struct Alarm: Codable {
    let alarmTime: Date
    let alarmInfo: String
    let alarmMembers: [String]
    let alarmIsActive: Bool
}
