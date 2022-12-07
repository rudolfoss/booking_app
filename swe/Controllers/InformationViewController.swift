//
//  InformationViewController.swift
//  swe
//
//  Created by HA on 2022/11/11.
//

import UIKit
struct Ground {
    let info : String
    let post : String
}

class InformationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var ground : Ground?
    
    var grounds = [Ground(info: "축구장 이용안내", post: "운영시간 : (월~금) 09:00~18:00 / (주 중) 동아리, 단체 이용준비물 : 축구공, 축구화, 운동복 / 학생 무료" ), Ground(info:  "테니스장 이용안내", post: "운영시간 : (월~금) 09:00~21:00 / (토~일) 동아리, 단체 이용준비물 : 테니스 라켓, 공, 테니스화, 운동복 / 4인 1조 / 무료")]
                                                                                                                    
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grounds.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let ground = grounds[indexPath.row]
        cell.textLabel?.text = ground.info
            return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //row선택 했을때
        if let vc = storyboard?.instantiateViewController (identifier: "InfoDetailViewController") as?
            InfoDetailViewController{
            vc.ground = grounds[indexPath.row]
            self.navigationController?.pushViewController(vc,animated:true)
            
         
        }
    }
    
    
    
}

