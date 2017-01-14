//
//  SecondViewController.swift
//  calcultor01
//
//  Created by MIGGI on 2016/12/18.
//  Copyright © 2016年 MIGGI. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //ViewController.swiftから計算結果の値を受け取るための変数resultCal
    var resultCal = ""
    //resultCalを表示するためのラベルresultLabel
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = resultCal
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
