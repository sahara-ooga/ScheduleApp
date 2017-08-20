//
//  Utility.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/20.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

struct Utility {
    static func numberOfDays(in month:Int, year:Int)->Int?{
        //その月の初日をDate型で取得
        let calendar = Calendar(identifier: .gregorian)
        guard let dateOfFirstDay = calendar.date(from: DateComponents(year: year,
                                                                      month: month,
                                                                      day: 1))else{
                                                                        
                                                                        return nil
        }
        
        let add = DateComponents(month: 1, day:-1)
        
        //当月の最終日を取得
        let dateOfLastDay = calendar.date(byAdding: add, to: dateOfFirstDay)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        let dateString = formatter.string(from: dateOfLastDay!)
        return Int(dateString)
    }

}
