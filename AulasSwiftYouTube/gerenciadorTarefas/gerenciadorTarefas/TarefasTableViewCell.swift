//
//  TarefasTableViewCell.swift
//  gerenciadorTarefas
//
//  Created by Eduardo dos santos on 12/01/15.
//  Copyright (c) 2015 megamil. All rights reserved.
//

import UIKit

class TarefasTableViewCell: UITableViewCell {

    init(Style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: Style, reuseIdentifier: reuseIdentifier)
        //Define as cores.
        self.backgroundColor = UIColor.frontColor()
        self.textLabel?.textColor = UIColor.cellFontColor()
        
        let gesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
        gesture.delegate = self
        self.addGestureRecognizer(gesture)
    }
    //o que fazer ao reconhecer um gesto
    func handlePan(rrecognizer: UIPanGestureRecognizer) {
        println("ahhh")
    }
    //limita a função acima a ser executada somente quando o movimento for horizoltal.
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        let recognizer = gestureRecognizer as UIPanGestureRecognizer
        let translation = recognizer.translationInView(self.superview!)
    
        if fabs(translation.x) > fabs(translation.y) {
            return true
        } else {
            //caso seja vertical.
            return false
        }
    
    }
    
    //Implementado pelo Xcode...
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}
