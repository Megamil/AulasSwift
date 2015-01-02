//
//  ViewController.swift
//  cursoYTP1
//
//  Created by Eduardo dos santos on 02/01/15.
//  Copyright (c) 2015 Eduardo dos santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var entradaNome: UITextField!
    @IBOutlet weak var exibeNome: UILabel!
    
    @IBAction func concatenar(sender: AnyObject) {
        
        exibeNome.text = "Olá, \(entradaNome.text)!"
        
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

