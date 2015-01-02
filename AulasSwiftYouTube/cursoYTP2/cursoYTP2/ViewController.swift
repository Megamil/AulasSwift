//
//  ViewController.swift
//  cursoYTP2
//
//  Created by Eduardo dos santos on 02/01/15.
//  Copyright (c) 2015 Eduardo dos santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderAlpha: UISlider!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelAlpha: UILabel!
    
    @IBAction func alterarValue() {
    
        //Usado para passar em RGB a nova cor para o background.
        let Cred = CGFloat(sliderRed.value)/255.0
        let Cgreen = CGFloat(sliderGreen.value)/255.0
        let Cblue = CGFloat(sliderBlue.value)/255.0
        let Calpha = CGFloat(sliderAlpha.value)/255.0
    
    
        //Muda o valor nas Labels.
        labelRed.text = "RED \(Int(sliderRed.value))"
        
        labelGreen.text = "GREEN \(Int(sliderGreen.value))"
        
        labelBlue.text = "BLUE \(Int(sliderBlue.value))"
        labelAlpha.text = "ALPHA \(Int(sliderAlpha.value))"
        
        let novoBackground = UIColor(red: Cred, green: Cgreen, blue: Cblue, alpha: Calpha)
        
        viewColor.backgroundColor = novoBackground
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        alterarValue()
    }


}

