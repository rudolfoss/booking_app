//
//  DetailViewController.swift
//  swe
//
//  Created by HA on 2022/11/04.
//

import UIKit

class DetailViewController: UIViewController {
    var board: Board?
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var peopleNum: UILabel!
    @IBOutlet weak var postText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = board?.title
        timeLabel.text = board?.time
        dateLabel.text = board?.date
        peopleNum.text = board?.people
        postText.text = board?.post
    }

}
