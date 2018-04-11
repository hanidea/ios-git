//
//  ViewController.swift
//  cal
//
//  Created by James on 2018/4/11.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textone: UITextField!
    @IBOutlet weak var texttwo: UITextField!
    @IBOutlet weak var resultlabel: UILabel!
    @IBAction func qingLing(_ sender: Any) {
        self.resultlabel.text="0"
        self.textone.text=""
        self.texttwo.text=""
    }
    @IBAction func calculate(_ sender: Any) {
        var num1 = Int(self.textone.text!)
        var num2 = Int(self.texttwo.text!)
        if(self.textone.text!.isEmpty){
            num1 = 0
        }
        if(self.texttwo.text!.isEmpty){
            num2 = 0
        }
        let resultNum = num1!+num2!
        let resultStr = Int(resultNum)
        print(resultStr)
        self.resultlabel.text = String(resultStr)
        self.textone.endEditing(true)
        self.texttwo.endEditing(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

