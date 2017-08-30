//
//  ScheduleDto.swift
//  Schedule
//
//  Created by yogasawara@stv on 2017/08/10.
//  Copyright © 2017年 SundayCarpenter. All rights reserved.
//

import Foundation

final class ScheduleDto: NSObject {
    var id = 0
    var title = ""
    var location = ""
    var startDate = Date()
    var endDate = Date()
    var detail = ""
    var deleteFlag = false
}

extension ScheduleDto{
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object,
            let reference = object as? ScheduleDto else {
            return false
        }
        
        return self.title == reference.title
            && self.location == reference.location
            && self.startDate == reference.startDate
            && self.endDate == reference.endDate
            && self.detail == reference.detail
            && self.deleteFlag == reference.deleteFlag
    }
}
