//
//  MonthViewSettings.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/20.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

struct MonthViewSettings{
    static let kNumberOfSection = 2
    static let kNumberOfItemInYobiSection = 7
    
    enum Section:Int {
        case yobi = 0,
        day
    }
    
}
