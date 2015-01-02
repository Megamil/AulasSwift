//
//  ViewController.swift
//  Localizar
//
//  Created by Eduardo dos santos on 31/12/14.
//  Copyright (c) 2014 Eduardo dos santos. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    //Definir configurações para o uso do CLLocation
    
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

