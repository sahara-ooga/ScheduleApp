//
//  MonthViewCell.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/17.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class MonthViewCell: UICollectionViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var indicatorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(for indexPath:IndexPath,selectedMonth:Int,selectedYear:Int) {
        //日曜日なら赤文字、土曜日は青文字、その他黒文字
        //日曜始まりなので、７で割ったあまりが０なら日曜日のセルになる
        if indexPath.row % 7 == 0{
            makeLabelsRed()
        }else if indexPath.row % 7 == 6{
            makeLabelsBlue()
        }else{
            makeLabelsBlack()
        }
        
        //FIXME:曜日のセクションか日のセクションで表示を切り替える
        switch indexPath.section {
            //曜日表示のセクションの場合
            case MonthViewSettings.Section.yobi.rawValue:
                self.dayLabel.text = yobi(on: indexPath.item)
                self.indicatorLabel.text = ""
            //日にちセクションの場合
            case MonthViewSettings.Section.day.rawValue:
                //このマスの日付を取得
                let dt = date(at: indexPath,
                              monthOfDisplay: selectedMonth,
                              year: selectedYear)
                let formatter = DateFormatter()
                formatter.dateFormat = "d"
                self.dayLabel.text = formatter.string(from: dt!)
            default:
                self.dayLabel.text = ""
        }
        
        //当該月に含まれていなければ、文字色を灰色にする
    }
}

//MARK: Utility
extension MonthViewCell{
    //MARK: label color
    func makeLabelsRed() {
        dayLabel.textColor = UIColor.red
        indicatorLabel.textColor = UIColor.red
    }
    
    func makeLabelsBlue() {
        dayLabel.textColor = UIColor.blue
        indicatorLabel.textColor = UIColor.blue
    }
    
    func makeLabelsBlack() {
        dayLabel.textColor = UIColor.black
        indicatorLabel.textColor = UIColor.black
    }
    
    func makeLabelsGlay(){
        dayLabel.textColor = UIColor.gray
        indicatorLabel.textColor = UIColor.gray
    }
    
    //MARK:label text info for each section
    
    /// そのセルに表示すべき曜日を返す
    ///
    /// - Parameter row: 左から何番目か
    /// - Returns: 日本語の曜日("日","月" etc.)
    func yobi(on row:Int)->String{
        var calender = Calendar.current
        calender.locale = Locale(identifier: "ja_JP")
        return calender.shortWeekdaySymbols[row]
    }
    
    /// CollectionView内の位置から、そのセルの日付を割り出す
    ///
    /// - Parameters:
    ///   - indexPath: そのセルの位置
    ///   - monthOfDisplay: 表示したい月
    ///   - year: 表示したい月のある年
    /// - Returns: そのセルが表示したい月
    func date(at indexPath:IndexPath,monthOfDisplay:Int,year:Int) -> Date? {
        //曜日のセクションならnilを返す
        if indexPath.section == 0{
            return nil
        }
        
        //その月の初日をDate型で取得
        let calendar = Calendar(identifier: .gregorian)
        guard let dateOfFirstDay = calendar.date(from: DateComponents(year: year,
                                                                      month: monthOfDisplay,
                                                                      day: 1))else{return nil}
            
        //その月の初日が何曜日か
        //.weekdayは1から始まる
        //例：1:日曜日、7:土曜日
        let weekdayOfFirstDay = calendar.component(.weekday,
                                                   from: dateOfFirstDay)
        
        //その月の初日が何番目のセルなのか
        //注意：セルは0番目から始まるので、１引くことで確定する
        //例：2017年8月1日は火曜日なので、weekdayOfFirstDayは３、itemOfFirstDayは２になる
        let itemOfFirstDay = weekdayOfFirstDay - 1
        
        //今、自分は何日に当たるのか
        //指定された位置と１日の差を見る
        let diff = indexPath.item - itemOfFirstDay
        let add = DateComponents(day:diff)
        return calendar.date(byAdding: add, to: dateOfFirstDay)
    }
}
