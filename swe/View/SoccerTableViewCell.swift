//
//  SoccerTableViewCell.swift
//  swe
//
//  Created by HA on 2022/11/19.
//

import UIKit

class SoccerTableViewCell: UITableViewCell {
    static let cellId = "SoccerTableViewCell"
    static let height: CGFloat = 84
    weak var viewController: UIViewController?
    
    @IBOutlet weak var reservationButton: UIButton!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func reservButtonPressed(_ sender: Any) {
        if colorView.backgroundColor == .green {
            colorView.backgroundColor = .red
            print("예약되었습니다.")
        }else{
            print("이미 예약되었습니다.")
        }
            
    }
    func showAlert(title:String, content:String, okBtb:String, noBtn:String) {
            // [UIAlertController 객체 정의 실시]
            let alert = UIAlertController(title: title, message: content, preferredStyle: UIAlertController.Style.alert)
            
            // [인풋으로 들어온 확인 버튼이 nil 아닌 경우]
            if(okBtb != "" && okBtb.count>0){
                let okAction = UIAlertAction(title: okBtb, style: .default) { (action) in
                    // [확인 버튼 클릭 이벤트 내용 정의 실시]
                    return
                }
                alert.addAction(okAction) // 버튼 클릭 이벤트 객체 연결
            }
            
            // [인풋으로 들어온 취소 버튼이 nil 아닌 경우]
            if(noBtn != "" && noBtn.count>0){
                let noAction = UIAlertAction(title: noBtn, style: .default) { (action) in
                    // [취소 버튼 클릭 이벤트 내용 정의 실시]
                    return
                }
                alert.addAction(noAction) // 버튼 클릭 이벤트 객체 연결
            }
            // [alert 팝업창 활성 실시]
        viewController?.present(alert, animated: false, completion: nil)
        }
    
}
