//
//  CustomCollectionViewCell.swift
//  swe
//
//  Created by HA on 2022/11/03.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    func setLabel(label:String) {
        mainLbl.text = label
    }
    
}
