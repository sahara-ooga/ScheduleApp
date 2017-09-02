//
//  MonthViewCellTest.swift
//  ScheduleApp
//
//  Created by Yuu Ogasa on 2017/08/18.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
@testable import ScheduleApp
import Nimble
import Quick

class MonthViewCellTest: XCTestCase {
    
    var cell:MonthViewCell!
    var calendar:Calendar!
    
    override func setUp() {
        super.setUp()
        
        //cellの初期化
        let nib = UINib(nibName: String(describing: MonthViewCell.self), bundle: nil)
        guard let monthViewCell = nib.instantiate(withOwner: nil,
                                                  options: nil).first as? MonthViewCell else {
            fatalError()
        }
        cell = monthViewCell
        calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale.current
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
    
    //2017年8月のカレンダー、7/30,31,8/1,31,9/1,2
    func testDateAt0730InAugust2017() {
        let cellDate = cell.date(at: IndexPath(item: 0, section: 1),
                                 monthOfDisplay: 8, year: 2017)
        let calenderDate = calendar.date(from:DateComponents(year:2017,month:7,day:30))
        expect(cellDate).to(equal(calenderDate))
    }
    
    func testDateAt0731InAugust2017() {
        let cellDate = cell.date(at: IndexPath(item: 1, section: 1),
                                 monthOfDisplay: 8, year: 2017)
        let calenderDate = calendar.date(from:DateComponents(year:2017,month:7,day:31))
        expect(cellDate).to(equal(calenderDate))
    }
    
    func testDateForFirstAugust2017() {
        let date = cell.date(at: IndexPath(item: 2, section: 1),
                             monthOfDisplay: 8, year: 2017)
        XCTAssertEqual(date,calendar.date(from:DateComponents(year:2017,month:8,day:1)))
    }
    
    func testDateForFirstSeptember2017() {
        let date = cell.date(at: IndexPath(item: 33, section: 1),
                             monthOfDisplay: 8, year: 2017)
        XCTAssertEqual(date,calendar.date(from:DateComponents(year:2017,month:9,day:1)))
    }
    
    // MARK:日付ラベルが正しくセットされているか
    /// 7月31日は、8月のカレンダーでは灰色で表示されている
    func testSetCellFor0731InAugust2017(){
        cell.set(for: IndexPath(item: 1, section: 1),
                 selectedMonth: 8,
                 selectedYear: 2017)
        XCTAssertEqual(cell.dayLabel.text, "31")
        expect(self.cell.dayLabel.textColor).to(equal(UIColor.gray))
    }
    
    /// 8月1日は黒
    func testSetCellFor0801InAugust2017() {
        cell.set(for: IndexPath(item: 2, section: 1),
                 selectedMonth: 8,
                 selectedYear: 2017)
        XCTAssertEqual(cell.dayLabel.text, "1")
        expect(self.cell.dayLabel.textColor).to(equal(UIColor.black))
    }
    
    /// 8月5日は青
    func testSetCellFor0805InAugust2017() {
        cell.set(for: IndexPath(item: 6, section: 1),
                 selectedMonth: 8,
                 selectedYear: 2017)
        XCTAssertEqual(cell.dayLabel.text, "5")
        expect(self.cell.dayLabel.textColor).to(equal(UIColor.blue))
    }
    
    /// 8月6日は赤
    func testSetCellFor0806InAugust2017() {
        cell.set(for: IndexPath(item: 7, section: 1),
                 selectedMonth: 8,
                 selectedYear: 2017)
        XCTAssertEqual(cell.dayLabel.text, "6")
        expect(self.cell.dayLabel.textColor).to(equal(UIColor.red))
    }
}
