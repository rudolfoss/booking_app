//
//  CustomCollectionView.swift
//  swe
//
//  Created by HA on 2022/11/03.
//

import UIKit

class CustomCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var labels = ["나의 예약","예약하기","구인하기","이용안내","공지사항","설정"]
    private var imageName : [ String ] = ["img1", "img2", "img3", "img4", "img5", "img6"]
    
    //collectionview의 cell object
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CustomCollectionViewCell
        
        
            cell.imageCell.image = UIImage(named: imageName[indexPath.row]) ?? UIImage()
            cell.setLabel(label: labels[indexPath.row])
            return cell
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.dataSource = self
            self.delegate = self
        }
    
    //collectionview item 개수
        func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
            return labels.count
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
            return 1
        }
    
    // CollectionView Cell의 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    

    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: 130, height: 140)
        }

}
