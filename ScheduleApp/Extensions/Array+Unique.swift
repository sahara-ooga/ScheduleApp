//
//  Array+Unique.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/21.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

// reduceを用いて重複要素を取り除く
extension Array where Element: Equatable {
    var unique: [Element] {
        return reduce([]) { $0.0.contains($0.1) ? $0.0 : $0.0 + [$0.1] }
    }
}
