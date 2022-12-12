//
//  ViewController.swift
//  swe
//
//  Created by HA on 2022/10/07.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonDidTap(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        if UserDefaults.standard.string(forKey: name) == nil {
            //회원가입이 안되어있을때
            print("데이터가 없습니다.")
        }else if password != UserDefaults.standard.string(forKey: name) {
            print("비밀번호가 알맞지 않습니다.")
            
        }else if password == "" || name == "" {
            print("정보를 다시 입력 하세요.")
            
        }else {
            self.performSegue(withIdentifier: "LoginToSelect", sender: self)
            print("로그인 성공!")
        }
       // userDataManager.login(email: email, password: password){}
    }
    

}

