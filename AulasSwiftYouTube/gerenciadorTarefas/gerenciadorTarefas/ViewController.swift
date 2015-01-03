//
//  ViewController.swift
//  gerenciadorTarefas
//
//  Created by Eduardo dos santos on 03/01/15.
//  Copyright (c) 2015 Eduardo dos santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabela: UITableView!
    @IBOutlet weak var entradaTarefas: UITextField!
    
    var tarefas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTarefa() {
        
        //Valida se o usuário digitou algo
        if entradaTarefas.text == "" {
            return
        }
        
        //Adiciona o conteúdo ao Array
        tarefas.append(entradaTarefas.text)
        
        //Limpa o campo de texto
        entradaTarefas.text = ""
        
        //Esconde o teclado
        entradaTarefas.resignFirstResponder()
        
        //Recarrega as informações da tabela
        tabela.reloadData()
        
    }
    //Informar quantas linhas de retorno existiram para serem exibidas.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return tarefas.count
        
    }
    
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = tabela.dequeueReusableCellWithIdentifier("Cells", forIndexPath: indexPath) as UITableViewCell
    
        configurandoCell(cell, atIndexPath: indexPath)

        return cell
    
    }
    
    func configurandoCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        
        let tarefa = tarefas[indexPath.row]
        cell.textLabel?.text = tarefa
        
    }

}