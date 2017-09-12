//
//  IndicatorDataProviderTest.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/11.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
import Nimble
import FMDB

@testable import ScheduleApp

class IndicatorDataProviderTest: XCTestCase {
    let dao = ScheduleDao(dbPath: TestCommonDefines.dbPath)
    let provider = IndicatorDataProvider(dbPath: TestCommonDefines.dbPath)
    
    override func setUp() {
        super.setUp()
        
        self.clean()
        let _ = dao.createTable()
    }
    
    override func tearDown() {
        self.clean()
        super.tearDown()
    }
    
    /// 該当するスケジュールがなくて、falseが返ってくるケース
    func testShouldNotIndicate() {
        //DBに２件レコードを追加
        insertTwoRecord()
        
        //存在しないケース
        let result = provider.shouldIndicate(at: Date(timeInterval: 60*60*24*3, since: Date()))
        let expectation = false
        expect(result) == expectation
    }
    
    /// 該当するスケジュールが存在する場合
    func testShouldIndicate(){
        //DBに２件レコードを追加
        insertTwoRecord()
        
        //スケジュールが存在するケース
        let result = provider.shouldIndicate(at: Date())
        let expectation = true
        expect(result) == expectation
    }
    
    
}

// MARK: - ヘルパーメソッド
extension IndicatorDataProviderTest {
    /// データベースファイルを消去する
    func clean() {
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
    func insertTwoRecord() {
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
}

