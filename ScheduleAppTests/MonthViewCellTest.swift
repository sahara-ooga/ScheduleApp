//
//  MonthViewCellTest.swift
//  ScheduleApp
//
//  Created by Yuu Ogasa on 2017/08/18.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
@testable import ScheduleApp

class MonthViewCellTest: XCTestCase {
    
    //let cell:MonthViewCell!
    
    override func setUp() {
        super.setUp()
        //FIXME:cellの初期化
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testYobi(){
        var calender = Calendar.current
        calender.locale = Locale(identifier: "ja_JP")
        let weekdaySymbols = calender.shortWeekdaySymbols
        
//        for dayIndex in 0..<7{
//            XCTAssertEqual(cell.yobi(on:dayIndex),
//                           weekdaySymbols[dayIndex])
//        }
    }
    
    func testSetCellFor15thAugust2017() {
    }
}
