//
//  DateExtensionTest.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/21.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest

@testable import ScheduleApp

import Nimble
import Quick

class DateExtensionTest: XCTestCase {
    var calendar:Calendar{
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale.current
        return calendar
    }
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDateAfterHours(){
        let date = Date()
        let dateAfter3hours = date.after(hours:3)
        
        //timeIntervalSinceは秒単位なので、補正する必要がある
        let diff = dateAfter3hours.timeIntervalSince(date)
        expect(diff) ≈ 3.0 * 60 * 60
    }
    
    func testStartPoint() {
        let now = Date()
        let startPoint = now.startPoint()
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale.current
        
        expect(calendar.component(.day, from: startPoint)) == calendar.component(.day, from: now)
        expect(calendar.component(.hour, from: startPoint)) == 0
        expect(calendar.component(.minute, from: startPoint)) == 0
    }
    
    func testEndPoint() {
        let now = Date()
        guard let endPoint = now.endPoint() else{
            XCTFail("failed to generate endPoint")
            return
        }
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale.current
        
        expect(calendar.component(.day, from: endPoint)) == calendar.component(.day, from: now)
        expect(calendar.component(.hour, from: endPoint)) == 23
        expect(calendar.component(.minute, from: endPoint)) == 59
        expect(calendar.component(.second, from: endPoint)) == 59
    }
    
    /// dayStringのテスト
    func testDayStringAt0730(){
        let date = calendar.date(from:DateComponents(year:2017,month:7,day:30))
        expect(date?.dayString).to(equal("30"))
    }
    
    func testYear() {
        let date = calendar.date(from:DateComponents(year:2017,month:7,day:30))
        expect(date?.year) == 2017
    }
    
    func testMonth() {
        let date = calendar.date(from:DateComponents(year:2017,month:9,day:1))
        expect(date?.month) == 9
    }
    
    func testHour() {
        let date = calendar.date(from:DateComponents(year:2017,month:9,day:1,hour:20))
        expect(date?.hour) == 20
    }
    
    /// その月のカレンダーで表示する日数を返す
    func testNeededRowNumForCalendar() {
        expect(Date.date(at: 2017, month: 1, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 2, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 3, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 4, day: 10)?.neededRowNumberForCalendar()) == 6
        expect(Date.date(at: 2017, month: 5, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 6, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 7, day: 10)?.neededRowNumberForCalendar()) == 6
        expect(Date.date(at: 2017, month: 8, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 9, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 10, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 11, day: 10)?.neededRowNumberForCalendar()) == 5
        expect(Date.date(at: 2017, month: 12, day: 10)?.neededRowNumberForCalendar()) == 6
    }
    
    func testTitleForThisMonth() {
        expect(Date.date(at: 2017, month: 9, day: 4)?.titleForThisMonth) == "2017年9月"
    }
    
    func testStringForDayViewTitle(){
        expect(Date.date(at: 2017, month: 9, day: 15)?.stringForDayViewTitle) == "9月15日"
    }
    
}
