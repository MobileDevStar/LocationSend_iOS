//
//  ViewController.swift
//  LocationSend
//
//  Created by simba on 10/31/19.
//  Copyright © 2019 simba. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate  {

    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        

    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            // you're good to go!
            print("start location")
            locationManager?.startUpdatingLocation()
            locationManager?.startMonitoringSignificantLocationChanges()
            locationManager?.allowsBackgroundLocationUpdates = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("New location is \(location)")
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
          //  location.altitude.
          //  Alamofire.req
            Alamofire.request("http://172.16.1.123/location/test.php", method: .get, parameters: ["latitude" : latitude, "longitude": longitude]).responseJSON { (responseData) -> Void in
                
                if((responseData.result.value) != nil) {
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    
                    print(swiftyJsonVar);
                }
                
               // print(responseData);
            }
        }
    }

}

