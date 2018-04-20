//
//  ViewController.swift
//  JsonExample
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //json调用
        let path = Bundle.main.path(forResource:"obj", ofType: "json");
        let url = URL(fileURLWithPath: path!);
        do{
            let data = try Data(contentsOf: url);
            let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers);
            let language = (json as! [String: Any])["language"] ;
            print(language!);
        }catch{
            print("读取本地数据出现错误",error);
        }
        //生成json
//        let dict = ["name":"James","age":37] as [String : Any];
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
//            let str = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue);
//            print(str!);
//        }
//        catch {
//            print(error)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

