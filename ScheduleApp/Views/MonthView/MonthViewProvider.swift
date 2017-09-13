//
//  MonthViewProvider.swift
//  ScheduleApp
//
//  Created by Yuu Ogasa on 2017/08/18.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

protocol MonthViewDataSource:UICollectionViewDataSource {
    var selectedDate:Date! {get set}
}

class MonthViewProvider: NSObject,MonthViewDataSource {
    var selectedMonth:Int{
        get {
            return self.selectedDate.month
        }
    }
    
    var selectedYear:Int{
        get {
            return self.selectedDate.year
        }
    }
    
    var selectedDate:Date!

    //MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MonthViewSettings.kNumberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case MonthViewSettings.Section.yobi.rawValue:
            return MonthViewSettings.kNumberOfItemInYobiSection
        case MonthViewSettings.Section.day.rawValue:
            //その月の日をすべて含み、足りないところは前月・翌月の日で埋める正方形になるように表示する
            let numberOfWeeks = selectedDate.neededRowNumberForCalendar()
            return numberOfWeeks * CommonDefines.daysOfWeek
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MonthViewCell.self),
                                                      for: indexPath) as! MonthViewCell
        cell.set(for:indexPath,
                 selectedMonth: self.selectedMonth,
                 selectedYear: self.selectedYear)
        
        return cell
    }
}
