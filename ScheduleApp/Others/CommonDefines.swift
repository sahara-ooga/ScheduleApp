//
//  constants.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/02.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

struct CommonDefines {
    static let DBname = "schedule.db"
    
    static let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                     .userDomainMask,
                                                     true).last!.appendingPathComponent(DBname)
}

