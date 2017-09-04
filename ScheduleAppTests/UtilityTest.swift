//
//  UtilityTest.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/20.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
import Nimble

@testable import ScheduleApp

class UtilityTest: XCTestCase {
    
    let utility = Utility()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfDays() {
        expect(Utility.numberOfDays(in:8, of:2017)) == 31
        expect(Utility.numberOfDays(in: 2, of: 2017)) == 28
        expect(Utility.numberOfDays(in: 2, of: 2000)) == 29
    }
}
