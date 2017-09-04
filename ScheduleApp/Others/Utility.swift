//
//  Utility.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/20.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

struct Utility {
    static func numberOfDays(in month:Month, of year:Int)->Int?{
        //その月の初日をDate型で取得
        let calendar = Calendar(identifier: .gregorian)
        guard let dateOfFirstDay = calendar.date(from: DateComponents(year: year,
                                                                      month: month,
                                                                      day: 1))else{return nil}
        
        let add = DateComponents(month: 1, day:-1)
        
        //当月の最終日を取得
        let dateOfLastDay = calendar.date(byAdding: add, to: dateOfFirstDay)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        let dateString = formatter.string(from: dateOfLastDay!)
        return Int(dateString)
    }

    // *****************
    // MARK: Alert Message
    // *****************
    /// OK アラートメッセージダイアログを表示する
    ///
    /// - Parameters:
    ///   - title: タイトル
    ///   - message: メッセージ
    ///   - vc: 表示元VC & delegate
    ///   - nextSelector: 閉じた後実行するセレクタ
    static func showOkAlertMessage(title: String?, message: String?,
                                  vc: UIViewController,
                                  nextSelector: Selector?) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            //OK
            let delegate = vc as? AlertMessageDelegate
            delegate?.completeActionBoAlertMessage(action: action,
                                                   nextSelector: nextSelector)
        }
        
        alertController.addAction(alertAction)
        
        // 表示
        vc.present(alertController, animated: true, completion: nil)
    }
    
    /// OK キャンセル 確認メッセージダイアログを表示する
    ///
    /// - Parameters:
    ///   - title: タイトル
    ///   - message: メッセージ
    ///   - vc: 表示元VC & delegate
    ///   - nextSelector: ダイアログを閉じた後実行するセレクタ ※OK・キャンセルどちらを押しても実行される
    static func showOkConfirmMessage(title: String, message: String?,
                                    vc: UIViewController,
                                    nextSelector: Selector?) {
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        
        let delegate = vc as? AlertMessageDelegate
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
            //OK
            delegate?.completeActionBoAlertMessage(action: action,
                                                   nextSelector: nextSelector)
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "キャンセル",
                                         style: .cancel) { (action) in
            //Cancel
            delegate?.completeActionBoAlertMessage(action: action,
                                                   nextSelector: nextSelector)
        }
        
        alertController.addAction(cancelAction)
        
        //表示
        vc.present(alertController, animated: true, completion: nil)
    }
}

/**
 *  プロトコル
 */
protocol AlertMessageDelegate : class {
    func completeActionBoAlertMessage(action: UIAlertAction,
                                      nextSelector: Selector?)
    
}
