//
//  Utility.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/20.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

struct Utility {
    // *****************
    // MARK: Manage Date
    // *****************
    static func numberOfDays(in month:Int, of year:Int)->Int?{
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
    
    /// デバッグ時に表示される
    ///
    /// - Parameters:
    ///   - object: <#object description#>
    ///   - function: <#function description#>
    ///   - file: <#file description#>
    ///   - line: <#line description#>
    ///　https://qiita.com/taketomato/items/d5630fe5df45f4093720#10-debug-logs
    func dprint(object: Any?,
                function: StaticString = #function,
                file: StaticString = #file,
                line: UInt = #line) {
        #if DEBUG
            let format = DateFormatter()
            format.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
            let encodedFilePath = NSString(string: String(describing: file)).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.alphanumerics)
            let fileName = NSURL(string: String(describing: encodedFilePath))?.lastPathComponent
            Swift.print("\(format.string(from: Date())) \(String(describing: fileName)) [\(line)] \(function): \(object ?? "nil")",
                terminator: "\n")
        #endif
    }
}

/**
 *  プロトコル
 */
protocol AlertMessageDelegate : class {
    func completeActionBoAlertMessage(action: UIAlertAction,
                                      nextSelector: Selector?)
    
}
