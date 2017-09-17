//
//  constants.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/02.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

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
