//
//  MonthViewProvider.swift
//  ScheduleApp
//
//  Created by Yuu Ogasa on 2017/08/18.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class MonthViewProvider: NSObject {
    var selectedMonth:Int = 1
    var selectedYear:Int = 2017
}

//MARK: UICollectionViewDataSource
extension MonthViewProvider:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MonthViewSettings.kNumberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1
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
