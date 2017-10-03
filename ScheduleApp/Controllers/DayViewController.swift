//
//  DayViewController.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/17.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dayViewDataSource:DayViewDataSource!
    var selectedDate:Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayViewDataSource = DayViewProvider()
        tableView.dataSource = dayViewDataSource
        tableView.delegate = self
        
        setTitle(for: selectedDate)
        
        //NOTE: 登録しないとxibファイルから読み込まれない
        tableView.register(UINib.init(nibName: String(describing: DayViewCell.self),
                                      bundle: nil),
                           forCellReuseIdentifier: String(describing: DayViewCell.self))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dayViewDataSource.selectedDate = self.selectedDate
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

extension DayViewController{
    func setTitle(for date:Date) {
        self.navigationItem.title = date.stringForDayViewTitle
    }
}

extension DayViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        //画面を遷移する
        //選ばれた日次を伝える
        //その時間にタスクがあれば、そのタスクの情報も渡す
//        if dayViewDataSource.scheduleExists(at: indexPath.row){
//            showScheduleView(with: dayViewDataSource.schedule(at:indexPath.row))
//        }else{
//            showScheduleView(with: nil)
//        }
        showScheduleView(at: indexPath)
    }
}

extension DayViewController{
    func showScheduleView(at indexPath:IndexPath){
        let storyboard: UIStoryboard = UIStoryboard(name: "ScheduleView", bundle: nil)
        let scheduleVC = storyboard.instantiateInitialViewController() as! ScheduleViewController
        
        let year = selectedDate.year
        let month = selectedDate.month
        let day = selectedDate.day
        let hour = indexPath.row
        
        let date = Date.date(at: year, month: month, day: day, hour: hour, minite: 0)
        scheduleVC.selectedDate = date
        scheduleVC.schedule = dayViewDataSource.schedule(at:indexPath.row)
        self.navigationController?.pushViewController(scheduleVC, animated: true)
    }
    
    func showScheduleView(with schedule:ScheduleDto?){
        let storyboard: UIStoryboard = UIStoryboard(name: "ScheduleView", bundle: nil)
        let scheduleVC = storyboard.instantiateInitialViewController() as! ScheduleViewController
        scheduleVC.schedule = schedule
        self.navigationController?.pushViewController(scheduleVC, animated: true)
    }
}
