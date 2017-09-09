//
//  MonthViewFlowLayout.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/21.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class MonthViewFlowLayout: NSObject,UICollectionViewDelegateFlowLayout {
    let cellMargin:CGFloat = 2.0
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case MonthViewSettings.Section.yobi.rawValue:
            let daysParWeek:CGFloat = CGFloat(MonthViewSettings.kNumberOfItemInYobiSection)
            let numberOfMargin:CGFloat =  CGFloat(daysParWeek + 1)
            let width:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / daysParWeek
            let height:CGFloat = width * 0.3
            return CGSize(width: width, height: height)
            
        case MonthViewSettings.Section.day.rawValue:
            let daysParWeek:CGFloat = CGFloat(MonthViewSettings.kNumberOfItemInYobiSection)
            let numberOfMargin:CGFloat =  CGFloat(daysParWeek + 1)
            let width:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / daysParWeek
            let height:CGFloat = width * 1.5
            return CGSize(width: width, height: height)
            
        default:
            let daysParWeek:CGFloat = CGFloat(MonthViewSettings.kNumberOfItemInYobiSection)
            let numberOfMargin:CGFloat =  CGFloat(daysParWeek + 1)
            let width:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / daysParWeek
            let height:CGFloat = width * 1.5
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellMargin, left: cellMargin,
                            bottom: cellMargin, right: cellMargin)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
}
