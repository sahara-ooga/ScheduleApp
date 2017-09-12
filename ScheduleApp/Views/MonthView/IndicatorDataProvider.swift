//
//  IndicatorDataProvider.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/09/10.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

protocol IndicatorDataSource {
    var dao:BaseDao {get}
    
    func shouldIndicate(at date:Date)->Bool
}

struct IndicatorDataProvider: IndicatorDataSource {
    var dao: BaseDao
    
    /// dbのパスを指定するイニシャライザ
    ///
    /// - Parameter dbPath: デフォルトでは本番用のdbを生成する。テスト用にdbPathを渡すことも出来る
    init(dbPath:String) {
        dao = ScheduleDao(dbPath: dbPath)
    }
    
    init() {
        dao = ScheduleDao()
    }
    
    /// daoからスケジュールの有無を引き出して、インジケータを表示すべきかを返す
    ///
    /// - Parameter date: スケジュールの有無を問い合わせたい日付
    /// - Returns: 引数の日付に始まるスケジュールがあればTrue
    func shouldIndicate(at date:Date) -> Bool {
        return dao.haveSchedules(at: date)
    }
}
