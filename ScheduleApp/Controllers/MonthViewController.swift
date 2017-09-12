//
//  ViewController.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class MonthViewController: UIViewController {

    var monthViewDataSource:UICollectionViewDataSource!
    var flowLayout:UICollectionViewDelegateFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDB(at: CommonDefines.dbPath)
        //insertAndIndicatorTest()  //成功 at 2017/09/12
        //deleteAllRecord(at: CommonDefines.dbPath)
        setCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MonthViewController{
    func setCollectionView() {
        collectionView.register(UINib.init(nibName: String(describing: MonthViewCell.self),
                                           bundle: nil),
                                forCellWithReuseIdentifier: String(describing: MonthViewCell.self))
        let monthViewProvider = MonthViewProvider()
        monthViewProvider.selectedDate = Date()
        monthViewDataSource = monthViewProvider
        flowLayout = MonthViewFlowLayout()
        
        collectionView.dataSource = monthViewDataSource
        collectionView.delegate = flowLayout
    }
    
    func setDB(at path:String) {
        let dao = ScheduleDao(dbPath: path)
        _ = dao.createTable()
    }
}

extension MonthViewController{
    /// レコードを挿入して、インジケータが表示されることを確認するためのメソッド
    func insertAndIndicatorTest() {
        insertTwoRecord(at: CommonDefines.dbPath)
    }
    
    func deleteAllRecord(at path:String){
        //作ったスケジュールを削除する
        let dao = ScheduleDao(dbPath: path)
        _ = dao.deleteAll()
    }
    
    func insertTwoRecord(at path:String) {
        let startDate = Date()
        let endDate = Date(timeInterval: 60*60*1, since: Date())
        let startDate2 = Date(timeInterval: 60*60*24, since: Date())
        let endDate2 = Date(timeInterval: 60*60*3, since: startDate2)
        
        let scheduleDic1:[String:Any] = ["title":"title1","location":"富山",
                                         "startDate":startDate,"endDate":endDate,
                                         "detail":"detail1","deleteFlag":false]
        let scheduleDic2:[String:Any] = ["title":"title2","location":"青森",
                                         "startDate":startDate2,"endDate":endDate2,
                                         "detail":"detail2","deleteFlag":false]
        let scheduleDicArray = [scheduleDic1,scheduleDic2]
        
        var schedules = [ScheduleDto]()
        for dic in scheduleDicArray{
            let schedule = ScheduleDto()
            schedule.title = dic["title"] as! String
            schedule.location = dic["location"] as! String
            schedule.startDate = dic["startDate"] as! Date
            schedule.endDate = dic["endDate"] as! Date
            schedule.detail = dic["detail"] as! String
            schedule.deleteFlag = dic["deleteFlag"] as! Bool
            schedules.append(schedule)
        }
        
        //作ったスケジュールを挿入
        let dao = ScheduleDao(dbPath: path)
        _ = dao.insert(scheduleDtos: schedules)
    }

}

