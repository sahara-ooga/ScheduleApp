//
//  DayViewProviderTests.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/17.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
import Nimble
@testable import ScheduleApp

class DayViewProviderTests: XCTestCase {
    let startHour = 18
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testScheduledHours(){
        class DayViewProviderMock:DayViewProvider{
            override var schedules: [ScheduleDto]?{
                return TestCommonDefines.twoSchedules
            }
        }
        
        let mock = DayViewProviderMock()
        
        let result = mock.scheduledHours
        let expects = [TestCommonDefines.startHour,TestCommonDefines.startHour-1]
        expect(result) == expects
    }
}
