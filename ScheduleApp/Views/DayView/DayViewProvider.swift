//
//  DayViewProvider.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/17.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

protocol DayViewDataSource:UITableViewDataSource {
    var selectedDate:Date! {get set}
    var schedules:[ScheduleDto]? {get}
}

class DayViewProvider: NSObject,DayViewDataSource {
    
    //MARK: DayViewDataSource
    var selectedDate: Date!
    
    var schedules: [ScheduleDto]?{
        let dao = ScheduleDao()
        return dao.select(at: selectedDate)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DayViewSettings.numberOfSection
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return DayViewSettings.numberOfRow
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DayViewCell.self),
                                                      for: indexPath) as! DayViewCell
        //その日にスケジュールがあるかどうかを照会して、セルに情報を設定する
        cell.scheduled = scheduledHours?.contains(indexPath.row) ?? false
        
        cell.set(for:indexPath)
        
        return cell
    }
}

extension DayViewProvider{
    var scheduledHours:[Int]?{
        guard let s = schedules else {
            return nil
        }
        
        return s.map{ $0.startDate.hour }
    }
}
