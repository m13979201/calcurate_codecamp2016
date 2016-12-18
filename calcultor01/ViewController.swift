//
//  ViewController.swift
//  calcultor01
//
//  Created by MIGGI on 2016/12/09.
//  Copyright © 2016年 MIGGI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var prev_num_label: UILabel!
    @IBOutlet weak var text_label: UILabel!
    @IBOutlet weak var calc_label: UILabel!
    @IBOutlet weak var ans_label: UILabel!


    
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
        if Int(prev_num_label.text!) != nil && Int(text_label.text!) != nil {   //両方になにがしかの文字列が入っていれば四則演算可能
            //四則演算の分岐
            if calc_label.text == "+" {
                ans_label.text = String( Int(prev_num_label.text!)! + Int(text_label.text!)!)
            }
            
            if calc_label.text == "-" {
                ans_label.text = String( Int(prev_num_label.text!)! - Int(text_label.text!)!)
            }

            if calc_label.text == "×" {
                ans_label.text = String( Int(prev_num_label.text!)! * Int(text_label.text!)!)
            }

            if ans_label.text == "÷" {
                text_label.text = String( Int(prev_num_label.text!)! / Int(text_label.text!)!)
            }

        }
    }
    
    //ACでオールクリア
    @IBAction func allclear_pushed(_ sender: UIButton) {
        text_label.text = ""
        prev_num_label.text = ""
        calc_label.text = ""
        ans_label.text = ""

    }
    
    
    

}

