//
//  TennisTableViewCell.swift
//  swe
//
//  Created by HA on 2022/11/19.
//

import UIKit

class TennisTableViewCell: UITableViewCell {

    static let cellId = "TennisTableViewCell"
    static let height: CGFloat = 84
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var reservationButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func reservationButtonPressed(_ sender: Any) {
        if colorView.backgroundColor == .green {
            colorView.backgroundColor = .red
            print("예약되었습니다.")
        }else{
            print("이미 예약되었습니다.")
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
