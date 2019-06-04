//
//  ViewController.swift
//  Perceptron
//
//  Created by James on 2019/6/4.
//  Copyright © 2019 hanidea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
    *1.定义变量
    */
    //误差
    var losses:[Float]=[]
    //学习率
    let rate:Float = 0.2
    //训练次数
    let n = 50
    //训练集
    var trainData:[[Float]]=[[0.0,0.0],[0.0,1.0],[1.0,0.0],[1.0,1.0]]
    var tempData:[[Float]]=[]
    //真值
    var trainLabel:[Float] = []
    var tempLabel:[Float] = []
    //参数
    var W:[Float]=[0.0,0.0,0.0]
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var segmentCtr: UISegmentedControl!
    @IBOutlet weak var field_x2: UITextField!
    @IBOutlet weak var field_x1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //取0到1之间的随机数
    func getRandomNumber()->Float{
        return Float(arc4random())/Float(RAND_MAX)
    }
    /*
     *2.激活函数
     */
    func activation(x:Float)->Float{
        return x>0.0 ? 1 : 0.0
    }
    /*
     *3.随机获取样本
     */
    func randomSample()->([Float],Float){
        if self.tempLabel.count == 0{
            self.tempData += self.trainData
            self.tempLabel += self.trainLabel
        }
        let loc = Int(arc4random()) %
            self.tempData.count
        let data = self.tempData[loc]
        let label = self.tempLabel[loc]
        self.tempData.remove(at: loc)
        self.tempLabel.remove(at: loc)
        return(data,label)
    }
    /*
     *4.训练
     */
    func train(label:[Float]){
        //先给trainlabel赋值
        self.trainLabel = label
        //再初始化参数
        for i in 0..<3{
            let w = self.getRandomNumber()
            W[i] = w
        }
        //迭代训练
        losses.removeAll()
        for i in 0..<n{
            let sample = self.randomSample()
            let result = W[1]*sample.0[0]+W[2]*sample.0[1]+W[0]*1
            let loss = self.activation(x: result)-sample.1
            let my_loss:String = String.init(format:"%.2f",loss)
            print("训练第\(i)次，loss为\(my_loss)")
            losses.append(loss)
            //更新参数
            for (index,_) in W.enumerated(){
                if index == 0{
                    W[index] -= self.rate*loss*1
                }else{
                    W[index] -= self.rate*loss*sample.0[index-1]
                }
            }
        }
        
    }
    @IBAction func TrainBtnAct(_ sender: Any) {
        //判断是什么操作
        switch segmentCtr.selectedSegmentIndex{
        //与操作
        case 0:
            self.train(label: [0.0,0.0,0.0,1.0])
        //或操作
        case 1:
            self.train(label: [0.0,1.0,1.0,1.0])
        default:
            return
        }
    }
    @IBAction func TestBtnAct(_ sender: Any) {
        if field_x1.text == "" || field_x2.text == ""{
            print("请输入带测试的X1和X2")
            return
        }
        let result = W[0]*1+W[1]*Float(field_x1.text!)!+W[2]*Float(field_x2.text!)!
        self.resultLbl.text="\(self.activation(x: result))"
    }
    

}

