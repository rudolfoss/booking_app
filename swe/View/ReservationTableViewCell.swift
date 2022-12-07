//
//  ReservationTableViewCell.swift
//  swe
//
//  Created by HA on 2022/12/01.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {

    static let cellId = "ReservationTableViewCell"
    static let height: CGFloat = 84

    @IBOutlet weak var groundLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
