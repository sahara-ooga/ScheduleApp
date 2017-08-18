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
    
    func set(for indexPath:IndexPath) {
        //日曜日なら赤文字、土曜日は青文字、その他黒文字
        //日曜始まりなので、７で割ったあまりが０なら日曜日のセルになる
        if indexPath.row % 7 == 0{
            makeLabelsRed()
        }else if indexPath.row % 7 == 6{
            makeLabelsBlue()
        }else{
            makeLabelsBlack()
        }
        
        //曜日のセクションか日のセクションで表示を切り替える
        
    }
}

//MARK: Utility
extension MonthViewCell{
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
}
