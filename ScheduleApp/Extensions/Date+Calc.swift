//
//  Date+Calc.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/21.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

public extension Date{
    //X時間後の日付を返す
    func after(hours:Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let add = DateComponents(hour:hours)
        return calendar.date(byAdding: add, to: self)!
    }
}
