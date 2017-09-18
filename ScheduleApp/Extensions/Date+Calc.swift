//
//  Date+Calc.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/21.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

public extension Date{
    
    static func date(at year:Int = 2017, month:Int,day:Int = 1)->Date?{
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.date(from: DateComponents(year: year,
                                                  month: month,
                                                  day: day))
    }
    
    static func date(at year:Int = 2017, month:Int,day:Int = 1,
                     hour:Int = 0,minite:Int = 0)->Date?{
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.date(from: DateComponents(year: year,
                                                  month: month,
                                                  day: day,
                                                  hour:hour,
                                                  minute:minite))
    }
    
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
    
    /// 指定された日時の日付の文字列。システムのタイムゾーンに従う
    var dayString:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
    
    var year:Int{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.year, from: self)
    }
    
    var month:Int{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.month, from: self)
    }
    
    var hour:Int{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.hour, from: self)
    }
    
}

// MARK: - カレンダー表示に必要なメソッド
extension Date{
    var titleForThisMonth:String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年M月"
        return formatter.string(from: self)
    }
    
    var stringForDayViewTitle:String{
        let formatter = DateFormatter()
        formatter.dateFormat = "M月d日"
        return formatter.string(from: self)
    }
    
    /// その月の日数
    var numberOfDays:Int{
        //その月の初日をDate型で取得
        let calendar = Calendar(identifier: .gregorian)
        
        //当月の最終日を取得
        let dateOfLastDay = self.lastDateOfMonth!
        
        return calendar.component(.day, from: dateOfLastDay)
    }
    
    /// 月の初日
    var firstDateOfMonth:Date?{
        let calendar = Calendar(identifier: .gregorian)
        var component = calendar.dateComponents([.year,.month,.day] ,from: self)
        component.day = 1
        
        return calendar.date(from: component)
    }
    
    /// 月の末日
    var lastDateOfMonth:Date?{
        let calendar = Calendar(identifier: .gregorian)
        guard let firstDateOfMonth = self.firstDateOfMonth else { return nil }
        let comps = DateComponents(month:1,day:-1)
        return calendar.date(byAdding: comps, to: firstDateOfMonth)
    }
    
    /// グレゴリオ暦の曜日を番号で返す。
    ///
    /// - Returns: 日曜日は１。土曜日は７
    var weekDay:Int{
        var calender = Calendar(identifier: .gregorian)
        calender.locale = Locale.current
        return calender.component(.weekday, from: self)
    }
    
    /// 該当月のカレンダーに必要な行数を返す
    ///
    /// - Returns: カレンダーの行数
    func neededRowNumberForCalendar()->Int{
        let firstDate = self.firstDateOfMonth!
        
        //1日が土曜日の場合、2月なら5行必要.2月でなければ6行必要
        if (firstDate.weekDay == 7) {
            if (firstDate.month == 2) {
                return 5;
            }else{
                return 6;
            }
        }
        
        //1日が金曜日なら、31日ある月なら6行必要、それ以外は5行必要
        if (firstDate.weekDay == 6) {
            if (self.numberOfDays == 31) {
                return 6;
            }else{
                return 5;
            }
        }
        
        //「1日が日曜で2月」でないなら５行
        //　言い換えると
        //「１日が日曜でない」または「２月でない」なら５行
        if ((firstDate.weekDay != 1) || (self.month != 2)){
            return 5;
        }
        
        //「1日が日曜で2月」でかつうるう年なら５行
        if (firstDate.weekDay == 1 && self.month == 2 && self.numberOfDays == 29) {
            return 5;
        }
        
        // 上記以外４
        return 4
    }
    
    var dayInPreviusMonth:Date?{
        let calendar = Calendar(identifier: .gregorian)
        let comps = DateComponents(month:-1)
        return calendar.date(byAdding: comps, to: self)
    }
    
    var dayInForwardMonth:Date?{
        let calendar = Calendar(identifier: .gregorian)
        let comps = DateComponents(month:1)
        return calendar.date(byAdding: comps, to: self)
    }
    
}
