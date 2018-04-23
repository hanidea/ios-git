//
//  ViewController.swift
//  PM25Data
//
//  Created by James on 2018/4/23.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var showLabel: UILabel!
    func loadPM25Data(){
        showLabel.text = "加载中...";
        //创建URL对象
        let urlString:String="http://aqicn.org/publishingdata/json"
        let url = URL(string:urlString)
        //创建请求对象
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let semaphore = DispatchSemaphore(value: 0)
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {(data, response, error) -> Void in
                                            if error != nil{
                                                print(error!)
                                            }else{
                                                let str = String(data: data!, encoding: String.Encoding.utf8)
                                                //print(str!)
                                                print("\(String(describing: data))");
                                            }
                                            semaphore.signal()
        }) as URLSessionTask
        
        //使用resume方法启动任务
        dataTask.resume()
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        //print("数据加载完毕！")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadPM25Data()
    }

    @IBAction func reloadOnClick(_ sender: Any) {
    loadPM25Data()
    }
    @IBOutlet weak var reloadOnClick: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

