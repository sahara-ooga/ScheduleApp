//
//  TestUtility.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/10/01.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation
@testable import ScheduleApp

struct TestUtility {
    private static let dao = ScheduleDao(dbPath: TestCommonDefines.dbPath)
    
    /// データベースファイルを消去する
    static func clean() {
        let manager = FileManager.default
        if manager.fileExists(atPath: TestCommonDefines.dbPath) {
            do {
                try manager.removeItem(atPath: TestCommonDefines.dbPath)
            } catch {
                print("Error: faild to remove database file.")
            }
        }
    }
    
    /// 今日・明日のスケジュールを挿入する
    static func insertTwoRecord() {
        let startDate = Date()
        let endDate = Date(timeInterval: 60*60*1, since: Date())
        let tomorrowStartDate = Date(timeInterval: 60*60*24, since: Date())
        let tomorrowEndDate = Date(timeInterval: 60*60*3, since: tomorrowStartDate)
        
        let scheduleDic1:[String:Any] = ["title":"title1","location":"富山",
                                         "startDate":startDate,"endDate":endDate,
                                         "detail":"detail1","deleteFlag":false]
        let scheduleDic2:[String:Any] = ["title":"title2","location":"青森",
                                         "startDate":tomorrowStartDate,"endDate":tomorrowEndDate,
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
        
        //作ったスケジュールを挿入
        _ = dao.insert(scheduleDtos: schedules)
    }
    
    ///時刻・期間を指定してスケジュールを保存する
    static func insertSchedules(at dates:[Date],duration:Int){
        let schedules:[ScheduleDto] = dates.enumerated().map{
            let endDate = Date(timeInterval: TimeInterval(60*60*duration),
                               since: $0.element)
            
            let schedule = ScheduleDto()
            schedule.title = "title" + String($0.offset)
            schedule.location = "location" + String($0.offset)
            schedule.startDate = $0.element
            schedule.endDate = endDate
            schedule.detail = String($0.offset)
            schedule.deleteFlag = false
            
            return schedule
        }

        //作ったスケジュールを挿入
        _ = dao.insert(scheduleDtos: schedules)
    }
    
    /// テーブルを作る
    static func createTable(){
        _ = dao.createTable()
    }
}
