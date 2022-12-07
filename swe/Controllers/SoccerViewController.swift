//
//  SoccerViewController.swift
//  swe
//
//  Created by HA on 2022/11/07.
//

import UIKit
import FSCalendar

class SoccerViewController: UIViewController,FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    @IBOutlet weak var calanderView: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        calanderView.delegate = self
        calanderView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) { // 날짜 선택 시 콜백 메소드
            guard let nextView = self.storyboard?.instantiateViewController(identifier: "SoccerCalViewController") as? SoccerCalViewController else { return }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            nextView.text = dateFormatter.string(from: date)
        
        self.navigationController?.pushViewController(nextView, animated: true)
        }

}
