//
//  ViewController.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class MonthViewController: UIViewController {

    var monthViewDataSource:MonthViewDataSource!
    var flowLayout:UICollectionViewDelegateFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedDate:Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期表示には現在時刻を元にする
        selectedDate = Date()
        
        setDB(at: CommonDefines.dbPath)
        
        //insertAndIndicatorTest()  //成功 at 2017/09/12
        //deleteAllRecord(at: CommonDefines.dbPath)
        //showDayView()
        setCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MonthViewController:MonthViewFlowLayoutDelegate{
    func didSelectItem(at indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MonthViewCell
        showDayView(for: cell.date)
    }
}

private extension MonthViewController{
    func setCollectionView() {
        collectionView.register(UINib.init(nibName: String(describing: MonthViewCell.self),
                                           bundle: nil),
                                forCellWithReuseIdentifier: String(describing: MonthViewCell.self))
        let monthViewProvider = MonthViewProvider()
        monthViewProvider.selectedDate = selectedDate
        monthViewDataSource = monthViewProvider
        
        let monthViewFlowLayout = MonthViewFlowLayout()
        monthViewFlowLayout.delegete = self
        flowLayout = monthViewFlowLayout
        collectionView.dataSource = monthViewDataSource
        collectionView.delegate = flowLayout
        
        setTitle(for: selectedDate)
    }
    
    func setTitle(for date:Date) {
        self.navigationItem.title = date.titleForThisMonth
    }
    
    func setDB(at path:String) {
        let dao = ScheduleDao(dbPath: path)
        _ = dao.createTable()
    }
}

// MARK: - レコードと表示の関係を確かめるためのメソッド群
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

// MARK: - ツールバーのボタンに対応するメソッド
extension MonthViewController{
    @IBAction func tapPreviusMonth(sender:UIBarButtonItem){
        selectedDate = selectedDate.dayInPreviusMonth
        monthViewDataSource.selectedDate = selectedDate
        setTitle(for: selectedDate)
        self.collectionView.reloadData()
    }
    
    @IBAction func tapNextMonth(sender:UIBarButtonItem){
        selectedDate = selectedDate.dayInForwardMonth
        monthViewDataSource.selectedDate = selectedDate
        setTitle(for: selectedDate)
        self.collectionView.reloadData()
    }
}

extension MonthViewController{
    func addFormView(){
        let storyboard: UIStoryboard = UIStoryboard(name: "ScheduleView", bundle: nil)
        let scheduleVC = storyboard.instantiateInitialViewController() as! ScheduleViewController
        self.present(scheduleVC, animated: true, completion: nil)
    }
    
    func showDayView(for date:Date){
        let storyboard: UIStoryboard = UIStoryboard(name: "DayView", bundle: nil)
        let dayVC = storyboard.instantiateInitialViewController() as! DayViewController
        dayVC.selectedDate = date
        self.navigationController?.pushViewController(dayVC, animated: true)
    }
}


