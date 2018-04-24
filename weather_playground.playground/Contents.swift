//: Playground - noun: a place where people can play

import UIKit
//let session = URLSession.shared;
////let request = NSURLRequest(URL: NSURL(string: "http://aqicn.org/publishingdata/json"));
//let task = session.dataTask(with: NSURLRequest(url: NSURL(string: "http://aqicn.org/publishingdata/json")! as URL) as URLRequest, completionHandler: { (data, response, error) -> Void in
//    let string = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//    print("\(String(describing: string))")
//})
////task.resume()
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
                                        
                                        
                                    }
                                    
                                    semaphore.signal()
}) as URLSessionTask

//使用resume方法启动任务
dataTask.resume()

_ = semaphore.wait(timeout: DispatchTime.distantFuture)
print("数据加载完毕！")
//继续执行其他代码.......
