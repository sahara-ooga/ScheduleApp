//
//  DayViewCellTest.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/23.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
import Nimble
@testable import ScheduleApp

class DayViewCellTest: XCTestCase {
    var cell:DayViewCell!

    override func setUp() {
        super.setUp()
        TestUtility.clean()
        TestUtility.createTable()
        
        //setCell()
    }
    
    override func tearDown() {
        TestUtility.clean()
        super.tearDown()
    }
    
    func testScheduledCellColor() {
        // スケジュールを保存
        insertRecord()
        
        //this code is thanks to https://medium.com/cocoaacademymag/unit-testing-uitableview-2387f3a42b4f
        
        let date = Date()
        let dayViewPr = DayViewProvider(dbPath: TestCommonDefines.dbPath)
        dayViewPr.selectedDate = date

        let tableView = UITableView()
        tableView.register(UINib.init(nibName: String(describing: DayViewCell.self),
                                      bundle: nil),
                           forCellReuseIdentifier: String(describing: DayViewCell.self))
        tableView.dataSource = dayViewPr
        let indexPath = IndexPath(row: date.hour, section: 0)
        let c = dayViewPr.tableView(tableView, cellForRowAt:indexPath) as! DayViewCell
        expect(c.backgroundColor) == DayViewSettings.scheduledColor
        
        //指定した時間以外のセルは背景色が変わっていない
        let index = IndexPath(row: date.hour - 1, section: 0)
        let unscheduledCell = dayViewPr.tableView(tableView, cellForRowAt:index) as! DayViewCell
        expect(unscheduledCell.backgroundColor) == DayViewSettings.unScheduledColor
    }
    
}

extension DayViewCellTest{
    
    func insertRecord() {
        TestUtility.insertSchedules(at: [Date()], duration: 3)
    }
}
