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

    var cycleTimer : Timer?
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // 设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
         //注册Cell
        collectionView.register(UINib(nibName: "ImgeViewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ImgeViewCellID)
        
        //collectionView.delegate = self
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ImgeViewCellID)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImgeViewCellID, for: indexPath) as!ImgeViewCollectionViewCell
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
    }
}

extension HotelImageView:UICollectionViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1.获取滚动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        // 2.计算pageControl的currentIndex
       // pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
    
}

// MARK:- 对定时器的操作方法
extension HotelImageView {
    fileprivate func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    
    fileprivate func removeCycleTimer() {
        cycleTimer?.invalidate() // 从运行循环中移除
        cycleTimer = nil
        
    }
    
    @objc fileprivate func scrollToNext() {
        // 1.获取滚动的偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        // 2.滚动该位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}

