//
//  RecruitTableViewCell.swift
//  swe
//
//  Created by HA on 2022/11/18.
//

import UIKit

class RecruitTableViewCell: UITableViewCell {

    static let cellId = "RecruitTableViewCell"
    static let height: CGFloat = 84
    
    @IBOutlet weak var peopleNum: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
