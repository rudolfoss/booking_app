//
//  CalendarViewController.swift
//  swe
//
//  Created by HA on 2022/11/09.
//

import UIKit
import FSCalendar

struct Infoa {
    let title: String
    let time: String
    let color: UIColor
    
}

class TennisCalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataLabel: UILabel!
    var text : String = ""
    
    var infoas = [
        Infoa(title: "1 코트", time: "14:00 ~ 15:00", color: .red),
        Infoa(title: "1 코트", time: "15:00 ~ 16:00", color: .red),
        Infoa(title: "1 코트", time: "16:00 ~ 17:00", color: .green),

        Infoa(title: "2 코트", time: "14:00 ~ 15:00", color: .red),
        Infoa(title: "2 코트", time: "15:00 ~ 16:00", color: .red),
        Infoa(title: "2 코트", time: "16:00 ~ 17:00", color: .green),

        Infoa(title: "3 코트", time: "14:00 ~ 15:00", color: .red),
        Infoa(title: "3 코트", time: "15:00 ~ 16:00", color: .red),
        Infoa(title: "3 코트", time: "16:00 ~ 17:00", color: .red)

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataLabel.text = text
        setupTableView()
        
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        setupCell()
    }
    
    func setupCell(){
        let nib = UINib(nibName: "TennisTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: TennisTableViewCell.cellId)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // return값을 Int로 받음. section(cell 한 묶음)의 개수를 정해주는 함수
        return infoas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TennisTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // return값이 UITableViewCell. 셀안에 무엇을 넣어줄지 정해주는 함수
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TennisTableViewCell.cellId, for: indexPath) as! TennisTableViewCell
        
        let infoa = infoas[indexPath.row]
        cell.titleLabel?.text = infoa.title
        cell.timeLabel?.text = infoa.time
        cell.colorView.backgroundColor = infoa.color
    
        return cell
    }
}

    
