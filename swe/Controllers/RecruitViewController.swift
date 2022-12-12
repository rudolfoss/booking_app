//
//  ReservationViewController.swift
//  swe
//
//  Created by HA on 2022/11/01.
//

import UIKit
import Alamofire

struct Board {
    let title: String
    let date: String
    let time: String
    let people: String
    let post: String
}

class RecruitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var board: Board?
    var boards = [
        Board(title: "축구 대운동장 모집", date: "11/14", time: "13:00 ~ 15:00", people: "3", post: "대운동장에서 OO팀과 축구하는데 인원 모집 합니다. 왼쪽 윙백 1, 수비형 미드필더 1, 골기퍼 1명 구합니다!" ),
        Board(title: "테니스 인원 모집", date: "11/15", time: "14:00 ~ 15:00", people: "2", post:"3코트에서 2:2로 테니스 할건데 연락주세요~ ")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        apend()
    }
 
    func apend(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        boards.append(Board(title: appDelegate?.sendinfo.title ?? "", date: appDelegate?.sendinfo.date ?? "", time: "",people: appDelegate?.sendinfo.people ?? "", post:appDelegate?.sendinfo.post ?? "" ))
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        setupCell()
    }
    
    func setupCell(){
        let nib = UINib(nibName: "RecruitTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: RecruitTableViewCell.cellId)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // return값을 Int로 받음. section(cell 한 묶음)의 개수를 정해주는 함수
        return boards.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RecruitTableViewCell.height
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // return값이 UITableViewCell. 셀안에 무엇을 넣어줄지 정해주는 함수
      
        let cell = tableView.dequeueReusableCell(withIdentifier: RecruitTableViewCell.cellId, for: indexPath) as! RecruitTableViewCell
        let board = boards[indexPath.row]
        cell.titleLabel?.text = board.title
        cell.dateLabel?.text = board.date
        cell.timeLabel?.text = board.time
        cell.peopleNum?.text = board.people
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let board = boards[indexPath.row]
        performSegue(withIdentifier: "sgDetail", sender: board)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "sgDetail" {
            if let ViewController = segue.destination as? DetailViewController{
                if let board = sender as? Board {
                    ViewController.board = board
                }
            }
        }
    }
    
}
