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
            self.dayLabel.text = ""
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
    
    // set label text info
    func yobi(on row:Int)->String{
        var calender = Calendar.current
        calender.locale = Locale(identifier: "ja_JP")
        return calender.shortWeekdaySymbols[row]
    }
    
    func date(at indexPath:IndexPath,month:Int,year:Int) -> Date {
        //TODO:ここを埋めていく
        //その月の初日が何曜日か
        //その月の初日が何番目のセルなのか
        //今、自分は何日に当たるのか
        
        return Date()
    }
}
