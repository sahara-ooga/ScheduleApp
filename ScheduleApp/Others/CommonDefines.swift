//
//  constants.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/02.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

struct CommonDefines {
    static let DBname = "Schedule.db"
    
    static let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                     .userDomainMask,
                                                     true).last!.appendingPathComponent(DBname)
    static let daysOfWeek = 7
    
    
}


struct ScheduleViewString {
    static let scheduleViewTitle = "ScheduleViewTitle"
    
    static let title = "title"
    static let location = "location"
    static let start_at = "start_at"
    static let end_at = "end_at"
    static let detail = "detail"
}

enum StringTable:String {
    case scheduleView = "ScheduleView"
    case localizable = "Localizable"
}

struct SystemColor {
    static let blue = UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1)
    static let green = UIColor(red: 76 / 255, green: 217 / 255, blue: 100 / 255, alpha: 1)
    static let red = UIColor(red: 1, green: 59 / 255, blue: 48 / 255, alpha: 1)
    static let gray = UIColor(red: 245 / 255, green: 245 / 255, blue: 247 / 255, alpha:1)
    static let deepGray = UIColor(red: 239 / 255, green: 239 / 255, blue: 244 / 255, alpha: 1)
}
