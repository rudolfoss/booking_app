//
//  WriteViewController.swift
//  swe
//
//  Created by HA on 2022/11/13.
//

import UIKit

struct Sendboard {
    let title: String
    let date: String
    let time: String
    let people: String
    let post: String
}

class WriteViewController: UIViewController {

    @IBOutlet weak var lblPickerTime: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var tfAdditem: UITextField!
    @IBOutlet weak var peopleLabel: UILabel!
    
    var sendboard: Sendboard?
    var board: Board?
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func presentStepper(_ sender: UIStepper) {
        
        peopleLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func ChangeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = formatter.string(from: datePickerView.date)
    }
    
    @IBAction func registButtonPressed(_ sender: Any) {

        guard let text = tfAdditem.text else { return }
        guard let content = contentTextView.text else { return }
        
        if text == "" || content == "" { return }
        
        //appdelegate에 값저장
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "RecruitViewController") as? RecruitViewController else {
                    return
                }
                let appDelegate = UIApplication.shared.delegate as? AppDelegate

        appDelegate?.sendinfo.title = tfAdditem.text ?? ""
        appDelegate?.sendinfo.date = lblPickerTime.text ?? ""
        appDelegate?.sendinfo.post = contentTextView.text ?? ""
        appDelegate?.sendinfo.people = peopleLabel.text ?? ""

        
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true,completion: nil)
        
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            if let ViewController = segue.destination as? DetailViewController{
                if let board = sender as? Board {
                    ViewController.board = board
                }
            }
        }
    }*/
}
