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
    
    var cell:MonthViewCell!
    let calendar = Calendar(identifier: .gregorian)
    
    override func setUp() {
        super.setUp()
        
        //cellの初期化
        let nib = UINib(nibName: String(describing: MonthViewCell.self), bundle: nil)
        guard let monthViewCell = nib.instantiate(withOwner: nil, options: nil).first as? MonthViewCell else {
            fatalError()
        }
        cell = monthViewCell
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /// 曜日ラベルが正しく設定されているテスト
    func testYobi(){
        var calender = Calendar.current
        calender.locale = Locale(identifier: "ja_JP")
        let weekdaySymbols = calender.shortWeekdaySymbols
        
        for dayIndex in 0..<6{
            XCTAssertEqual(cell.yobi(on:dayIndex),
                           weekdaySymbols[dayIndex])
        }
    }
    
    //TODO:テストすべき箇所の特定
    /// 2017年8月1日のセルの日付が正しく設定されていることをテスト
    func testDateForFirstAugust2017() {
        let date = cell.date(at: IndexPath(item: 2, section: 1),
                  monthOfDisplay: 8, year: 2017)
        XCTAssertEqual(date,calendar.date(from:DateComponents(year:2017,month:8,day:1)))
    }
    
    func testSetCellForFirstAugust2017() {
        cell.set(for: IndexPath(item: 2, section: 1),
                 selectedMonth: 8,
                 selectedYear: 2017)
        XCTAssertEqual(cell.dayLabel.text, "1")
    }
}
