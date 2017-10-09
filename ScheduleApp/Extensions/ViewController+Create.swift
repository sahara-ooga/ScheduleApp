//
//  ViewController+Create.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/10/09.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    // ViewControllerのファクトリーメソッド
    static func create() -> Self {
        let name: String = "\(type(of: self))".components(separatedBy: ".").first!
        return instantiate(storyboardName: name)
    }
    
    private static func instantiate<T>(storyboardName: String) -> T {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc: UIViewController? = storyboard.instantiateInitialViewController()
        return vc as! T
    }
}
