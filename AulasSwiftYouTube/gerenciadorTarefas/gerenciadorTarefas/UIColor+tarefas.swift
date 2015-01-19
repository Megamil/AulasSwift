//
//  UIColor+tarefas.swift
//  gerenciadorTarefas
//
//  Created by Eduardo dos santos on 19/01/15.
//  Copyright (c) 2015 megamil. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func backgroundColor() -> UIColor {
        return UIColor(red: 86.0/255.0, green: 149.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    }
    
    class func frontColor() -> UIColor {
        return UIColor(red: 97.0/255.0, green: 167.0/255.0, blue: 232.0/255.0, alpha: 1.0)
    }
    
    class func cellFontColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    class func completedTaskColor() -> UIColor {
        return UIColor(red: 90.0/255.0, green: 209.0/255.0, blue: 127.0/255.0, alpha: 1.0)
    }
    
    class func deletedTaskColor() -> UIColor {
        return UIColor(red: 236.0/255.0, green: 109.0/255.0, blue: 99.0/255.0, alpha: 1.0)
    }
    
}