//
//  ViewController.swift
//  ScheduleApp
//
//  Created by yogasawara@stv on 2017/08/14.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import UIKit

class MonthViewController: UIViewController {

    var monthViewDataSource:UICollectionViewDataSource!
    var flowLayout:UICollectionViewDelegateFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MonthViewController{
    func setCollectionView() {
        collectionView.register(UINib.init(nibName: String(describing: MonthViewCell.self),
                                           bundle: nil),
                                forCellWithReuseIdentifier: String(describing: MonthViewCell.self))
        let monthViewProvider = MonthViewProvider()
        monthViewProvider.selectedDate = Date()
        monthViewDataSource = monthViewProvider
        flowLayout = MonthViewFlowLayout()
        
        collectionView.dataSource = monthViewDataSource
        collectionView.delegate = flowLayout
    }
}

