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

    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section()
            <<< TextRow("TextFiled"){
                $0.title = NSLocalizedString(ScheduleViewString.title,
                                             tableName: StringTable.scheduleView.rawValue,
                                             comment: "")
                $0.placeholder = "ここに書いてね"
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
