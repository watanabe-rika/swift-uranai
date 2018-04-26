//
//  ResultViewController.swift
//  seimei-shindan
//
//  Created by 勝村里佳 on 2018/04/24.
//  Copyright © 2018年 jako. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var myGohan: String = ""

    // 退勤時刻
    @IBOutlet weak var myResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myResult.text = String(18 + arc4random_uniform(7)) + ":" + String(format: "%02d", arc4random_uniform(61))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
