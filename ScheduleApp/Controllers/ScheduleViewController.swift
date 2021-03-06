//
//  ScheduleViewController.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/13.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit
import Eureka

enum ScheduleVCState{
    case new(Date)
    case edit(ScheduleDto)
    
    var startDate:Date?{
        switch self {
        case .new(let startDate):
            return startDate
        default:
            return nil
        }
    }
    
    var schedule:ScheduleDto?{
        switch self {
        case .edit(let schedule):
            return schedule
        default:
            return nil
        }
    }
    
    init(at startDate:Date) {
        self = .new(startDate)
    }
    
    init(with schedule:ScheduleDto) {
        self = .edit(schedule)
    }
}

class ScheduleViewController: FormViewController {
    private var schedule:ScheduleDto?{
        return self.state.schedule
    }
    
    private var selectedDate:Date?{
        return self.state.startDate
    }
    
    var state:ScheduleVCState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setComponents()
    }
    
    func setComponents(){
        form +++ Section()
            //タイトル入力欄
            <<< TextRow("titleTextField"){
                $0.title = NSLocalizedString(ScheduleViewString.title,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                $0.placeholder = NSLocalizedString(ScheduleViewString.title,
                                                   tableName: StringTable.scheduleView.rawValue,
                                                   comment: "")
                if let title = schedule?.title{
                    $0.value = title
                }
                
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
                
                if let location = schedule?.location{
                    $0.value = location
                }
                
                }.onChange{[weak self] row in
                    self?.schedule?.location = row.value!
            }
            
            //開始時刻の表示
            <<< LabelRow("startTime") {
                $0.title = NSLocalizedString(ScheduleViewString.start_at,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                
                let f = DateFormatter()
                f.timeStyle = .short
                //f.dateStyle = .full
                
                if let date = schedule?.startDate{
                    $0.value = f.string(from: date)
                }else if let date = selectedDate{
                    $0.value = f.string(from: date)
                }
            }
            
            //終了時刻の表示
            <<< TimeRow("endTime"){
                $0.title = NSLocalizedString(ScheduleViewString.end_at,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                
                $0.value = schedule?.endDate
                
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
                if let detail = schedule?.detail{
                    $0.value = detail
                }
                
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 50)
                }.onChange{row in
                    self.schedule?.detail = row.value!
            }
        
            //保存・キャンセル
            +++ Section("save or cancel")
                <<< ButtonRow("save") { (row: ButtonRow) -> Void in
                        row.title = "save"//TODO:文言修正・ローカライズ
                    }
                    .onCellSelection { [weak self] (cell, row) in
                        self?.saveInfo()
                        self?.returnToDayView()
            }
         
                <<< ButtonRow("cancel") { (row: ButtonRow) -> Void in
                        row.title = "cancel"//TODO:ローカライズ
                    }
                    .onCellSelection { [weak self] (cell, row) in
                        self?.returnToDayView()
            }
    }
    
    func setNavigationBar() {
        self.navigationItem.title = "予定"
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                         target: self,
                                         action: #selector(tapSaveButton))
        self.navigationItem.setRightBarButton(saveButton, animated: true)
    }
    
    
    //MARK: Save Button
    
    func tapSaveButton(sender:Any) {
        //save info
        saveInfo()
        //transition
        returnToDayView()
    }

    func saveInfo() {
        let dao = ScheduleDao()
        guard let st = state else {
            return
        }
        
        guard let schedule = st.schedule else { return }
        
        switch st {
        case .new( _):
            _ = dao.insert(schedule)
            
        case .edit(let schedule):
            _ = dao.update(id: schedule.id,
                           title: schedule.title,
                           location: schedule.location,
                           startDate: schedule.startDate,
                           endDate: schedule.endDate,
                           detail: schedule.detail,
                           deleteFlag: schedule.deleteFlag)
        }
    }
    
    /// 日次画面への遷移
    func returnToDayView() {
        self.navigationController?.popViewController(animated: true)
    }
}
