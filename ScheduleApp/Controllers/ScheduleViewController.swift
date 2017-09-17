//
//  ScheduleViewController.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/13.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit
import Eureka

class ScheduleViewController: FormViewController {
    var schedule:ScheduleDto?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if schedule == nil {
            schedule = ScheduleDto()
        }
        
        form +++ Section()
            //タイトル入力欄
            <<< TextRow("titleTextField"){
                $0.title = NSLocalizedString(ScheduleViewString.title,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                $0.placeholder = NSLocalizedString(ScheduleViewString.title,
                                                   tableName: StringTable.scheduleView.rawValue,
                                                   comment: "")
                }.onChange{[weak self] row in
                    self?.schedule?.title = row.value!
            }
            
            //場所の入力欄
            <<< TextRow("locationTextField"){
                $0.title = NSLocalizedString(ScheduleViewString.location,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                $0.placeholder = NSLocalizedString(ScheduleViewString.location,
                                                   tableName: StringTable.scheduleView.rawValue,
                                                   comment: "")
                }.onChange{[weak self] row in
                    self?.schedule?.location = row.value!
            }
            
            //開始時刻の表示
            <<< LabelRow("startTime") {
                $0.title = NSLocalizedString(ScheduleViewString.start_at,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                $0.value = String(describing: schedule?.startDate ?? Date())
            }
            
            //終了時刻の表示
            <<< TimeRow("endTime"){
                $0.title = NSLocalizedString(ScheduleViewString.end_at,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                
                if let sc = self.schedule {
                    $0.value = sc.endDate
                }
                
                }.onChange{row in
                    self.schedule?.endDate = row.value!
        }
            //詳細入力欄
            <<< TextAreaRow("detail") {
                $0.title = NSLocalizedString(ScheduleViewString.detail,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                $0.placeholder = NSLocalizedString(ScheduleViewString.detail,
                                                   tableName: StringTable.scheduleView.rawValue,
                                                   comment: "")
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 50)
                }.onChange{row in
                    self.schedule?.detail = row.value!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
