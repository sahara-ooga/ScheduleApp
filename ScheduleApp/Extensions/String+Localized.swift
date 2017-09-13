//
//  String+Localized.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/13.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

public extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
