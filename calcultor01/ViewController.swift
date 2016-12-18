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
    
    
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var prev_num_label: UILabel!
    @IBOutlet weak var text_label: UILabel!
    @IBOutlet weak var calc_label: UILabel!
    @IBOutlet weak var ans_label: UILabel!
    
    var num_decision_nabeatsu:Int = 0 //ナベアツ判定用

    
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
        if Int(prev_num_label.text!) != nil && Int(text_label.text!) != nil {
            //四則演算の分岐
            if calc_label.text == "+" {
                num_decision_nabeatsu = Int(Int(prev_num_label.text!)! + Int(text_label.text!)!)
                ans_label.text = String( num_decision_nabeatsu )
            }
            
            if calc_label.text == "-" {
                num_decision_nabeatsu = Int(Int(prev_num_label.text!)! - Int(text_label.text!)!)
                ans_label.text = String( num_decision_nabeatsu )
            }

            if calc_label.text == "×" {
                num_decision_nabeatsu = Int(Int(prev_num_label.text!)! * Int(text_label.text!)!)
                ans_label.text = String( num_decision_nabeatsu )
            }

            if ans_label.text == "/" {
                num_decision_nabeatsu = Int(Int(prev_num_label.text!)! / Int(text_label.text!)!)
                ans_label.text = String( num_decision_nabeatsu )
            }

        }
        if num_decision_nabeatsu % 3 == 0 { //3の倍数のとき世界のナベアツが出てくる
            performSegue(withIdentifier: "callNabeatsu", sender: self)
        }
    }
    
    //sugueで別のviewcontrollerに値を渡す
    //このメソッドで渡す
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "Image_Nabeatsu" {//遷移先のviewcontrollerのIdentiferで判定
//            let secondViewController:SecondViewController = segue.destinationViewController as SecondViewController
//            
//            
//
//        }
    //}
    
    //ACでオールクリア
    @IBAction func allclear_pushed(_ sender: UIButton) {
        text_label.text = ""
        prev_num_label.text = ""
        calc_label.text = ""
        ans_label.text = ""

    }
    
    
    

}

