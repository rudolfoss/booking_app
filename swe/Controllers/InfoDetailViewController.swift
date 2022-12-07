//
//  ViewController.swift
//  swe
//
//  Created by HA on 2022/12/01.
//

import UIKit

class InfoDetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
    var ground: Ground?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = ground?.post
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
