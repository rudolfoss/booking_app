//
//  SignUpViewController.swift
//  swe
//
//  Created by HA on 2022/11/11.
//

import UIKit
import Foundation

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        guard let name = nameTextField.text else{
            return
        }
        guard let password = passwordTextField.text else{
            return
        }
        //userDataManager.register(email: email, password: password){}
       // userDataManager.postTest(email: email, password: password){}
        
        UserDefaults.standard.set(password, forKey: name)
        //"이름(key)" : "비밀번호(value)"
        print("이름: \(name), 비밀번호 \(password)")
        
        
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func cancelButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
