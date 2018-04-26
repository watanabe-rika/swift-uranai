//
//  ViewController.swift
//  seimei-shindan
//
//  Created by 勝村里佳 on 2018/04/24.
//  Copyright © 2018年 jako. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // テキストフィールド
    @IBOutlet weak var gohanText: UITextField!
    
    // 送信ボタン
    @IBOutlet weak var sendButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // テキストフィールドのdelegateを自分に指定
        gohanText.delegate = self
    }

    // テキストフィールドのdelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // ボタン押下時の処理
        self.sendButton.sendActions(for: .touchUpInside)

        return true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // プレースホルダーの値を初期化
        self.gohanText.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var ret = true

        if identifier == "showResult" {
            // 空だった場合のエラー処理
            guard self.gohanText.text != "" else {
                let AlertController = UIAlertController(title: "エラー", message: "ご飯を入力してね", preferredStyle: .alert)
                let defaultAction   = UIAlertAction(title: "OK", style: .default, handler: nil)
                AlertController.addAction(defaultAction)
                self.present(AlertController, animated: true, completion: nil)
                ret = false

                return ret
            }
        }
        return ret
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        guard let identifier = segue.identifier else {
            return
        }

        // 型をRVCに合わせてセグエの遷移先を宣言
        let resultVC = segue.destination as! ResultViewController

        // 入力した文字を遷移先で表示
        resultVC.myGohan = self.gohanText.text!

        // キーボードを操作対象から外す
        self.gohanText.resignFirstResponder()
    }

}

