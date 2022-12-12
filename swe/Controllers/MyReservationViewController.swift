//
//  MyReservationViewController.swift
//  swe
//
//  Created by HA on 2022/11/01.
//

import UIKit

struct List {
    let ground: String
    let date: String
    let time: String
}


class MyReservationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var list: List?

    var lists = [
        List(ground: "소 운동장", date: "12/16", time: "17:00 ~ 19:00"),
        List(ground: "1 코트", date: "12/16", time: "16:00 ~ 17:00")
    ]
    
    @IBOutlet weak var reservationTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView(){
        reservationTableView.delegate = self
        reservationTableView.dataSource = self
        setupCell()
    }
    
    func setupCell(){
        let nib = UINib(nibName: "ReservationTableViewCell", bundle: Bundle.main)
        reservationTableView.register(nib, forCellReuseIdentifier: ReservationTableViewCell.cellId)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // return값이 UITableViewCell. 셀안에 무엇을 넣어줄지 정해주는 함수
      
        let cell = reservationTableView.dequeueReusableCell(withIdentifier: ReservationTableViewCell.cellId, for: indexPath) as! ReservationTableViewCell
        let list = lists[indexPath.row]
        cell.groundLabel?.text = list.ground
        cell.dateLabel?.text = list.date
        cell.timeLabel?.text = list.time
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ReservationTableViewCell.height
    }
    
}
