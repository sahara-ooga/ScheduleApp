//
//  TestCommonDefines.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/02.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation
@testable import ScheduleApp

struct TestCommonDefines {
    static let testDBname = "ScheduleForTest.db"
    static let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                            .userDomainMask,
                                                            true).last!.appendingPathComponent(testDBname)
    static let startHour = 18

    static var twoSchedules:[ScheduleDto]{
        let startDate = Date.date(at: 2017, month: 9, day: 15,hour:startHour)!
        let endDate = Date(timeInterval: 60*60*1, since: startDate)
        let startDate2 = Date(timeInterval: 60*60*23, since:startDate)
        let endDate2 = Date(timeInterval: 60*60*3, since: startDate2)
        
        let scheduleDic1:[String:Any] = ["title":"title1","location":"富山",
                                         "startDate":startDate,"endDate":endDate,
                                         "detail":"detail1","deleteFlag":false]
        let scheduleDic2:[String:Any] = ["title":"title2","location":"青森",
                                         "startDate":startDate2,"endDate":endDate2,
                                         "detail":"detail2","deleteFlag":false]
        let scheduleDicArray = [scheduleDic1,scheduleDic2]
        
        var schedules = [ScheduleDto]()
        for dic in scheduleDicArray{
            let schedule = ScheduleDto()
            schedule.title = dic["title"] as! String
            schedule.location = dic["location"] as! String
            schedule.startDate = dic["startDate"] as! Date
            schedule.endDate = dic["endDate"] as! Date
            schedule.detail = dic["detail"] as! String
            schedule.deleteFlag = dic["deleteFlag"] as! Bool
            schedules.append(schedule)
        }
        
        return schedules
    }

}
