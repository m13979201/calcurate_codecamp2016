//
//  ViewController.swift
//  calcultor01
//
//  Created by MIGGI on 2016/12/09.
//  Copyright © 2016年 MIGGI. All rights reserved.
//

import UIKit

//世界のナベアツの表示判定・表示画像の呼び出しクラス
class DecisionNabeatsu: NSObject {
    
    //世界のナベアツが出演すべきかを判定
    //今回は未作成
    
    
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var prev_num_label: UILabel!
    @IBOutlet weak var text_label: UILabel!
    @IBOutlet weak var calc_label: UILabel!
    @IBOutlet weak var ans_label: UILabel!
    //ナベアツ判定用の変数
    var num_decision_nabeatsu:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一旦各labelに空文字を入力
        text_label.text = ""
        prev_num_label.text = ""
        calc_label.text = ""
        ans_label.text = ""
       
    }
    
    //警告を受け取ったときに呼ばれるメソッド　使用しているメモリ領域を解放する
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //数字はすべてこのfuncで取得
    @IBAction func num_button_pushed(_ sender: UIButton) {
        //動的にボタンのtextを取得？
        text_label.text! += sender.titleLabel!.text!
    }
    
    //四則演算の記号は全てこちらで取得
    @IBAction func calc_sign_pushed(_ sender: UIButton) {
        
        prev_num_label .text = text_label.text
        text_label.text = ""
        calc_label.text! = sender.titleLabel!.text!
    }

    //swift3から　AnyObject型　→Any型に変更
    //Any型はオブジェクトであればなんでも保管可能
    @IBAction func equal_pushed(_ sender: Any) {
        //両方になにがしかの文字列が入っていれば四則演算可能
        if Double(prev_num_label.text!) != nil && Double(text_label.text!) != nil {
            //四則演算の分岐
            if calc_label.text == "+" {
                num_decision_nabeatsu = Double(Double(prev_num_label.text!)! + Double(text_label.text!)!)
                ans_label.text = String( Int(num_decision_nabeatsu ))
            }
            
            if calc_label.text == "-" {
                num_decision_nabeatsu = Double(Double(prev_num_label.text!)! - Double(text_label.text!)!)
                ans_label.text = String( Int(num_decision_nabeatsu ))
            }

            if calc_label.text == "×" {
                num_decision_nabeatsu = Double(Double(prev_num_label.text!)! * Double(text_label.text!)!)
                ans_label.text = String( Int(num_decision_nabeatsu ))
            }

            if calc_label.text == "÷" {
//                num_decision_nabeatsu = Double(Double(prev_num_label.text!)! / Double(text_label.text!)!)
//                ans_label.text = String( Int(num_decision_nabeatsu ))
                num_decision_nabeatsu = Double(Double(prev_num_label.text!)! / Double(text_label.text!)!)
                print( num_decision_nabeatsu )
                ans_label.text = String( Int(num_decision_nabeatsu) )
            }

        }
        //
        //計算していないときにはナベアツがでないための処理を追加
        if ans_label.text != "" && (Int(num_decision_nabeatsu) % 3 == 0) {
                    performSegue(withIdentifier: "callNabeatsu", sender: self)
        }
    }
    
    //Segueで遷移する際に値を渡すメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //今は遷移先は一つしかない
        //viewController callNabeatsuに遷移する場合
        if segue.identifier == "callNabeatsu"{
            //callNabeatsuをインスタンス化
            let secondV = segue.destination as! SecondViewController
            //値をSecondViewControllerの表示用変数resultCalに計算結果のnum_decision_nabeatsuの値を渡す
            secondV.resultCal = String(Int(self.num_decision_nabeatsu))
        }
    }
    
    //secondViewControllerから戻るための設定
    @IBAction func returnToTopWithSegue(segue: UIStoryboardSegue) {}
    
    //ACでオールクリア
    @IBAction func allclear_pushed(_ sender: UIButton) {
        text_label.text = ""
        prev_num_label.text = ""
        calc_label.text = ""
        ans_label.text = ""
        num_decision_nabeatsu = 0.0

    }
    

}

