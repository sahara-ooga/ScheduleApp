//
//  DayViewCell.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/17.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class DayViewCell: UITableViewCell {

    var scheduled:Bool = false
    @IBOutlet weak var hourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(for indexPath:IndexPath) {
        //もしスケジュールがあったら、タイトルを設定する
        self.backgroundColor = scheduled ? DayViewSettings.scheduledColor : DayViewSettings.unScheduledColor
        self.hourLabel?.text = hourText(index: indexPath.row)
    }

}

extension DayViewCell{
    func hourText(index:Int) -> String {
        switch index {
        case 0:
            return "00:00~"
        case 1:
            return "00:30~"
        case 2:
            return "01:00~"
        case 3:
            return "01:30~"
        case 4:
            return "02:00~"
        case 5:
            return "02:30~"
        case 6:
            return "03:00~"
        case 7:
            return "03:30~"
        case 8:
            return "04:00~"
        case 9:
            return "04:30~"
        case 10:
            return "05:00~"
        case 11:
            return "05:30~"
        case 12:
            return "06:00~"
        case 13:
            return "06:30~"
        case 14:
            return "07:00~"
        case 15:
            return "07:30~"
        case 16:
            return "08:00~"
        case 17:
            return "08:30~"
        case 18:
            return "09:00~"
        case 19:
            return "09:30~"
        case 20:
            return "10:00~"
        case 21:
            return "10:30~"
        case 22:
            return "11:00~"
        case 23:
            return "11:30~"
        case 24:
            return "12:00~"
        case 25:
            return "12:30~"
        case 26:
            return "13:00~"
        case 27:
            return "13:30~"
        case 28:
            return "14:00~"
        case 29:
            return "14:30~"
        case 30:
            return "15:00~"
        case 31:
            return "15:30~"
        case 32:
            return "16:00~"
        case 33:
            return "16:30~"
        case 34:
            return "17:00~"
        case 35:
            return "17:30~"
        case 36:
            return "18:00~"
        case 37:
            return "18:30~"
        case 38:
            return "19:00~"
        case 39:
            return "19:30~"
        case 40:
            return "20:00~"
        case 41:
            return "20:30~"
        case 42:
            return "21:00~"
        case 43:
            return "21:30~"
        case 44:
            return "22:00~"
        case 45:
            return "22:30~"
        case 46:
            return "23:00~"
        case 47:
            return "23:30~"
        default:
            return "00:00~"
        }
    }
}
