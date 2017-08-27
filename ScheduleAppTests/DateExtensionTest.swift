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
    
}
