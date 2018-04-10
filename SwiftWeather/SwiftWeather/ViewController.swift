//
//  ViewController.swift
//  SwiftWeather
//
//  Created by James on 2018/4/9.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON
class ViewController: UIViewController,CLLocationManagerDelegate {
    let locationManager:CLLocationManager = CLLocationManager()
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var textlab: UILabel!
    @IBOutlet weak var temperature: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.loading.startAnimating()
        let backgroud = UIImage(named: "background")
        self.view.backgroundColor = UIColor(patternImage: backgroud!)
        if(ios8()){
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startUpdatingLocation()
    }
    func ios8()->Bool{
        let systemVersion = (UIDevice.current.systemVersion as NSString).floatValue
        print(systemVersion)
        return systemVersion >= 8.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location:CLLocation=locations[locations.count-1]
        if(location.horizontalAccuracy>0){
            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
            self.updateWeatherInfo(latitude: location.coordinate.latitude,
                                   longitude: location.coordinate.longitude,
                                   appid: "4f4be8fe7031dddd5dec789e01c1b3ac")
            locationManager.stopUpdatingLocation()
        }
    }
    func updateWeatherInfo(latitude:CLLocationDegrees,longitude:CLLocationDegrees,appid: String){
        let manager = AFHTTPSessionManager()
        let url = "http://api.openweathermap.org/data/2.5/weather?appid=4f4be8fe7031dddd5dec789e01c1b3ac"
        let params = ["lat": latitude,
                      "lon": longitude,
                      "appid": appid,
                      "cnt": 0] as [String : Any]
        manager.get(url, parameters: params,
                    progress: {(progress: Progress) in print("progress")},
                    success: {(operation:URLSessionDataTask!, responseObject: Any!)
                        in print("JSON: " + (responseObject as AnyObject).description)
                        self.updateUISuccess(jsonResult: responseObject as! NSDictionary)
        },
                    failure: {(operation:URLSessionDataTask?, error: Error!)
                        in print("Error: " + error.localizedDescription)})
        
    }
    func updateUISuccess(jsonResult:NSDictionary!) {
        self.loading.isHidden = true
        self.loading.stopAnimating()
        self.textlab.text = nil
        if let tempResult = (jsonResult["main"] as! NSDictionary)["temp"] as? Double {
            var temperature: Double
            if (jsonResult["sys"] as! NSDictionary)["country"]! as! String == "US"{
                // Convert temperature to Fahrenheit if use if within the US
                temperature = round(((tempResult - 273.15) * 1.8) + 32 )
            }
            else {
                // Otherwise, convert temperature to Celsius
                temperature = round(tempResult - 273.15)
            }
            self.temperature.text = "\(temperature)℃"
            let name = jsonResult["name"]! as! String
            self.location.text = "\(name)"
            let conditionArray = (jsonResult["weather"] as! NSArray)[0] as! NSDictionary
            let condition = conditionArray["id"] as! Int
            let sunrise =  (jsonResult["sys"] as! NSDictionary)["sunrise"] as! Double
            let sunset =  (jsonResult["sys"] as! NSDictionary)["sunset"] as! Double
            var nightTime = false
            let now = NSDate().timeIntervalSince1970
            if(now < sunrise || now > sunset) {
                nightTime = true
            }
            updateWeatherIcon(condition: condition,nightTime: nightTime)
        }
        else {
            self.textlab.text = "天气信息不可用"
        }
    }
    
    func updateWeatherIcon(condition: Int, nightTime: Bool) {
        if(condition < 300) {
            if nightTime {
                self.icon.image = UIImage(named: "tstorm1_night")
            }
            else {
                self.icon.image = UIImage(named: "tsorm1")
            }
        }
        else if(condition < 500) {
            self.icon.image = UIImage(named: "light_rain")
        }
        else if(condition < 600) {
            self.icon.image = UIImage(named: "shower3")
        }
        else if(condition < 700) {
            self.icon.image = UIImage(named: "snow4")
        }
        else if(condition < 771) {
            if nightTime {
                self.icon.image = UIImage(named: "fog_night")
            }
            else {
                self.icon.image = UIImage(named: "fog")
            }
        }
        else if(condition < 800) {
            self.icon.image = UIImage(named: "tstorm3")
        }
        else if(condition == 800) {
            if nightTime {
                self.icon.image = UIImage(named: "sunny_night")
            }
            else {
                self.icon.image = UIImage(named: "sunny")
            }
        }
        else if(condition < 804) {
            if nightTime {
                self.icon.image = UIImage(named: "cloudy2_night")
            }
            else {
                self.icon.image = UIImage(named: "cloudy2")
            }
        }
        else if(condition == 804) {
            self.icon.image = UIImage(named: "overcast")
        }
        else if((condition >= 900) || (condition > 904 && condition < 1000)) {
            self.icon.image = UIImage(named: "tstorm3")
        }
        else if(condition == 903) {
            self.icon.image = UIImage(named: "snow5")
        }
        else if(condition == 904) {
            self.icon.image = UIImage(named: "sunny")
        }
        else {
            self.icon.image = UIImage(named: "dunno")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error)
        self.textlab.text = "地理位置不可用"
    }


}

