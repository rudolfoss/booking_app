//
//  TennisViewController.swift
//  swe
//
//  Created by HA on 2022/11/07.
//

import UIKit
import FSCalendar

class TennisViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    @IBOutlet weak var calendarView: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
        calendarView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
 
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) { // 날짜 선택 시 TennisCalViewController 화면전환
        guard let nextView = self.storyboard?.instantiateViewController(identifier: "TennisCalViewController") as? TennisCalViewController else { return }
        
        //date format 변경 후 date정보 tennis cal view로 전달
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        nextView.text = dateFormatter.string(from: date)
        
        self.navigationController?.pushViewController(nextView, animated: true)
        
        }


}
