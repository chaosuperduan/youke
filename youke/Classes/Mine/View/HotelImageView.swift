//
//  HotelImageView.swift
//  youke
//
//  Created by Duan Chao on 2018/5/18.
//  Copyright © 2018年 M2Micro. All rights reserved.
//

import UIKit
private let ImgeViewCellID = "kCycleCellID"
class HotelImageView: UIView,NibLoad {

   
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // 设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
         //注册Cell
        //collectionView.register(UINib(nibName: "HotelImageView", bundle: nil), forCellWithReuseIdentifier: ImgeViewCellID)
        
        //collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ImgeViewCellID)
        collectionView.dataSource = self
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}
// MARK:- 遵守UICollectionView的数据源协议
extension HotelImageView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return (cycleModels?.count ?? 0) * 10000
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImgeViewCellID, for: indexPath) as!UICollectionViewCell
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
    }
}
