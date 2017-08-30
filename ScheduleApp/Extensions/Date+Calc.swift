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
    
    /// システムのロケールに於ける、AM0時00分のDateを返す
    ///
    /// - Parameter date: 取得したい日時
    /// - Returns: dateのシステムロケールにおける始まりの日時
    func startPoint()->Date{
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale.current
        
        return calendar.startOfDay(for: self)
    }
    
    /// システムロケールにおける、その日の最後の瞬間
    ///
    /// - Parameter date: 取得したい日時
    /// - Returns: dateのシステムロケールにおける終わりの瞬間
    func endPoint()->Date?{
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale.current
        
        let startPoint = calendar.startOfDay(for: self)
        let tomorrow = calendar.date(byAdding: .day,
                                     value:1,
                                     to: startPoint)
        let comps = DateComponents(second:-1)
        
        return calendar.date(byAdding: comps, to: tomorrow!)
    }
}
