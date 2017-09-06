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
        
        expect(calendar.component(.day, from: startPoint)).to(equal(calendar.component(.day, from: now)))
        expect(calendar.component(.hour, from: startPoint)).to(equal(0))
        expect(calendar.component(.minute, from: startPoint)).to(equal(0))
    }
    
    func testEndPoint() {
        let now = Date()
        guard let endPoint = now.endPoint() else{
            XCTFail("failed to generate endPoint")
            return
        }
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale.current
        
        expect(calendar.component(.day, from: endPoint)).to(equal(calendar.component(.day, from: now)))
        expect(calendar.component(.hour, from: endPoint)).to(equal(23))
        expect(calendar.component(.minute, from: endPoint)).to(equal(59))
        expect(calendar.component(.second, from: endPoint)).to(equal(59))
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
        let date = calendar.date(from:DateComponents(year:2017,month:7,day:30))
        expect(date?.month) == 7
    }
}
