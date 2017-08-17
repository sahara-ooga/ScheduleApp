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
}

//MARK: Utility
extension MonthViewCell{
    func makeLabelsRed() {
        dayLabel.textColor = UIColor.red
        indicatorLabel.textColor = UIColor.red
    }
    
    func makeLabelsBlack() {
        dayLabel.textColor = UIColor.black
        indicatorLabel.textColor = UIColor.black
    }
}
