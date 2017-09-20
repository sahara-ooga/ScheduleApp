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
    func scheduleExists(at row:Int)->Bool
    func schedule(at row:Int)->ScheduleDto?
    var dao:BaseDao {get}
}

class DayViewProvider: NSObject,DayViewDataSource {
    //MARK: DayViewDataSource
    var selectedDate: Date!
    var dao: BaseDao

    var schedules: [ScheduleDto]?{
        return dao.select(at: selectedDate)
    }
    
    var scheduledHours:[Int]?{
        guard let s = schedules else {
            return nil
        }
        
        let startAndEndHours = s.map{($0.startDate.hour,$0.endDate.hour)}
        
        //TODO:各要素のタプルから生成される区間に含まれる整数を取り出して並べる・ソートする
        var result = [Int]()
        
        startAndEndHours.forEach{start,end in }
        return nil
    }
    
    /// dbのパスを指定するイニシャライザ
    ///
    /// - Parameter dbPath: デフォルトでは本番用のdbを生成する。テスト用にdbPathを渡すことも出来る
    init(dbPath:String = CommonDefines.dbPath) {
        dao = ScheduleDao(dbPath: dbPath)
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
    
    // MARK: 各業に対するスケジュールの有無と取り出し
    func scheduleExists(at row: Int) -> Bool {
        //その日のスケジュールが無いなら、falseを返す
        if !dao.haveSchedules(at: selectedDate){
            return false
        }
        
        //その時間にスケジュールがあるか調べる
        var exist = false
        schedules?.forEach{
            if $0.startDate.hour == row{
                exist = true
            }
        }
        
        return exist
    }
    
    func schedule(at row: Int) -> ScheduleDto? {
        var dto:ScheduleDto? = nil
        schedules?.forEach{
            if $0.startDate.hour == row{
                dto = $0
            }
        }
        return dto
    }
}

