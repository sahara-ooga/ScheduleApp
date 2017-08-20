//
//  MonthViewProvider.swift
//  ScheduleApp
//
//  Created by Yuu Ogasa on 2017/08/18.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

typealias Month = Int

class MonthViewProvider: NSObject {
    var selectedMonth:Month = 1{
        didSet {
            //1から12の範囲内に収まっているようにする
            if selectedMonth < 1 || selectedMonth > 12 {
                selectedMonth = 1
            }
        }
    }
    
    var selectedYear:Int = 2017
}

//MARK: UICollectionViewDataSource
extension MonthViewProvider:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MonthViewSettings.kNumberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case MonthViewSettings.Section.yobi.rawValue:
            return MonthViewSettings.kNumberOfItemInYobiSection
        case MonthViewSettings.Section.day.rawValue:
            return Utility.numberOfDays(in: selectedMonth, of: selectedYear)!
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
