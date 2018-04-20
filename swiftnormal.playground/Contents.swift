//: Playground - noun: a place where people can play

import UIKit

//var str:NSString = "Hello, playground";
//str.substring(with: NSRange(location: 0, length: 5))
//var array:NSArray = [1,2,3,4]
//array.componentsJoined(by: ",")
//var array:NSMutableArray = [1,2,3]
//var array2 = array
//array2.add(4)
//array
//var red:CGFloat = 0.0,green:CGFloat=0.0,blue:CGFloat=0.0,alpha:CGFloat=0.0
//UIColor.red.getRed(&red,green:&green,blue:&blue,alpha:&alpha);
//red
//green
//blue
//alpha
//泛型
//var num1="4.0",num2="5.0"
//func swapValue<T>( num1:inout T , num2:inout T){
//    (num1,num2) = (num2,num1)
//}
//swapValue(num1: &num1, num2: &num2)
//num1
//num2
//guard func
//func checkup(person:[String:String]){
//    guard let id = person["id"] else {
//        print("没有身份证，不能进入考场")
//        return
//    }
//    guard let examNumber = person["examNumber"]else{
//        print("没有准考证，不能进入考场!")
//        return
//    }
//    print("您的身份证号为:\(id),准考证号为:\(examNumber)。请进入考场!")
//}
//checkup(person: ["id":"123456","examNumber":"654321"])
//didSet
//let MaxValue = 999
//let MinValue = -999
//var number = 0{
//    willSet{
//        print("\(number)变成\(newValue)")
//    }
//    didSet{
//        if number>MaxValue{
//            number = MaxValue
//        }else if number < MinValue{
//            number = MinValue
//        }
//        print("\(oldValue)变为\(number)")
//    }
//}
//number = 1000
//number
//extensions
//extension Int{
//    func times(closure:(()->())?){
//        if self >= 0 {
//            for _ in 0..<self{
//                closure?()
//            }
//        }
//    }
//}
//10.times{print("something")}
//协议扩展
//extension CustomStringConvertible{
//    var upperDescription:String{
//        return self.description.uppercased()
//    }
//}
//["key":"value"].upperDescription
//map,filter用法 flatmap区别过滤空值
//var result = [1,2,3,4,5].map{$0 * 2}
//result
//var images = (1...7).map{UIImage(named:"image\($0).png")}
//images.count
//images
//result=[1,2,3,4,5].filter{$0>2}
//result
//单例
class TestObject{
    private static let testObject=TestObject()
    static var sharedInstance:TestObject{
        return testObject
    }
    private init(){
        
    }
}
