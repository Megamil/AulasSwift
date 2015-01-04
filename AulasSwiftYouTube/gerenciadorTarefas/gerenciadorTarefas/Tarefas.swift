//
//  Tarefas.swift
//  gerenciadorTarefas
//
//  Created by Eduardo dos santos on 03/01/15.
//  Copyright (c) 2015 megamil. All rights reserved.
//
import CoreData

@objc(Tarefas) //Realiza compatibilidade com objective-c
class Tarefas: NSManagedObject {
    @NSManaged var name: String
    
   
}
