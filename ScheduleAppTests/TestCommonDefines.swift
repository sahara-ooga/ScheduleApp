//
//  TestCommonDefines.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/02.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

struct TestCommonDefines {
    static let testDBname = "ScheduleForTest.db"
    static let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                            .userDomainMask,
                                                            true).last!.appendingPathComponent(testDBname)
}
