//
//  MonthViewProviderTest.swift
//  ScheduleApp
//
//  Created by Yuu Ogasa on 2017/08/18.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import XCTest
import UIKit
import Nimble
@testable import ScheduleApp

class MonthViewProviderTest: XCTestCase {
    let monthViewProvider = MonthViewProvider()
    var colView:UICollectionView!
    
    override func setUp() {
        super.setUp()
        setCollectionView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNumberOfItemsInSection0() {
        let result = monthViewProvider.collectionView(colView,
                                         numberOfItemsInSection: 0)
        let expected = 7
        expect(result) == expected
    }
    
    func testNumberOfItemsInSection1AtFeb2017() {
        monthViewProvider.selectedDate = Date.date(at: 2017, month: 2)
        let result = monthViewProvider.collectionView(colView,
                                                      numberOfItemsInSection: 1)
        let expected = 35
        expect(result) == expected
    }
    
    func testNumberOfItemsInSection1AtJuly2017() {
        monthViewProvider.selectedDate = Date.date(at: 2017, month: 7)
        let result = monthViewProvider.collectionView(colView,
                                                      numberOfItemsInSection: 1)
        let expected = 42
        expect(result) == expected
    }
}

extension MonthViewProviderTest{
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 111, height: 111)
        
        let frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        colView = UICollectionView(frame: frame, collectionViewLayout: layout)
    }
}
