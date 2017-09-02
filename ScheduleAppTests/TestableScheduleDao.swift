//
//  TestableScheduleDao.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/02.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit
@testable import ScheduleApp

class TestableScheduleDao: ScheduleDao {
    var baseDao:TestableFMDBHelper{
        return TestableFMDBHelper()
    }
}
