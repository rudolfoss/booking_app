//
//  SoccerCalViewController.swift
//  swe
//
//  Created by HA on 2022/11/09.
//

import UIKit
import FSCalendar
import Alamofire

struct Info {
    let title: String
    let time: String
    let color: UIColor
    
}

class SoccerCalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataLabel: UILabel!
    var text : String = ""
    
    var infos = [
        Info(title: "소 운동장", time: "13:00 ~ 15:00", color: .red),
        Info(title: "소 운동장", time: "15:00 ~ 17:00", color: .red),
        Info(title: "소 운동장", time: "17:00 ~ 19:00", color: .green),

        Info(title: "대 운동장", time: "13:00 ~ 15:00", color: .red),
        Info(title: "대 운동장", time: "15:00 ~ 17:00", color: .red),
        Info(title: "대 운동장", time: "17:00 ~ 19:00", color: .red)
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
        let nib = UINib(nibName: "SoccerTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: SoccerTableViewCell.cellId)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // return값을 Int로 받음. section(cell 한 묶음)의 개수를 정해주는 함수
    //return dataSource.count
       return infos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SoccerTableViewCell.height
    }
    
    @objc func btn_Handler_Share(sender:UIButton) {
           let selectedIndexpath = sender.tag
           print(selectedIndexpath)
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // return값이 UITableViewCell. 셀안에 무엇을 넣어줄지 정해주는 함수
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SoccerTableViewCell.cellId, for: indexPath) as! SoccerTableViewCell
        
        let info = infos[indexPath.row]
        cell.titleLabel?.text = info.title
        cell.timeLabel?.text = info.time
        cell.colorView.backgroundColor = info.color
        cell.reservationButton.addTarget(self,action:#selector(btn_Handler_Share(sender:)), for: .touchUpInside)

        
        return cell
        
    }
    
    
}
