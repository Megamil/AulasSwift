//
//  ViewController.swift
//  gerenciadorTarefas
//
//  Created by Eduardo dos santos on 03/01/15.
//  Copyright (c) 2015 megamil. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tabela: UITableView!
    @IBOutlet weak var entradaTarefas: UITextField!
    
    //var tarefas = [String]() Usado antes do banco de dados.
    
    let contexto = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    var tarefas: NSFetchedResultsController {
        //Verifica se já existe conteúdo.
        if _tarefas != nil {
            return _tarefas!
        }
        
        //Consultando
        let request = NSFetchRequest()
        request.entity = NSEntityDescription.entityForName("Tarefas", inManagedObjectContext: contexto!)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let result = NSFetchedResultsController(fetchRequest: request, managedObjectContext: contexto!, sectionNameKeyPath: nil, cacheName: nil)
        
        result.delegate = self
        _tarefas = result
        
        var error: NSError? = nil
        
        //Em caso de erros, imprime o erro o encerra
        if !_tarefas!.performFetch(&error){
            print(error)
            abort()
        }
        
        return _tarefas!
    }
    
    
    
    
    var _tarefas: NSFetchedResultsController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //indica que o delegate do campo está aqui.
        entradaTarefas.delegate = self
        
        //Ajusta o tamanho das linhas na table view, mas também tem que deixar como 0 o numero de linhas da label da cecula.
        tabela.rowHeight = UITableViewAutomaticDimension
        tabela.registerClass(TarefasTableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        tabela.backgroundColor = UIColor.frontColor()
        self.view.backgroundColor = UIColor.frontColor()
        
        
    }
    
    
    
    
    @IBAction func addTarefa() {
        
        //Valida se o usuário digitou algo
        if entradaTarefas.text == "" {
            return
        }
        
        //Adiciona o conteúdo ao Array
        //tarefas.append(entradaTarefas.text) usado para o array
        let novaTarefa = NSEntityDescription.insertNewObjectForEntityForName("Tarefas", inManagedObjectContext: contexto!) as Tarefas
        novaTarefa.name = entradaTarefas.text
        
        //Em caso de erros ao inserir, imprime o erro o encerra
        salvarContexto()
        
        //Limpa o campo de texto
        entradaTarefas.text = ""
        
        //Esconde o teclado
        entradaTarefas.resignFirstResponder()
        
        //Recarrega as informações da tabela
        //tabela.reloadData() usado antes do banco de dados
        
    }
    
    
    
    
    func salvarContexto() {
        
        var error: NSError? = nil
        if !contexto!.save(&error){
            print(error)
            abort()
        }
        
    }
    
    
    
    
    //Informar quantas linhas de retorno existiram para serem exibidas.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return tarefas.count usado antes do banco de dados
        return tarefas.fetchedObjects!.count
        
    }
    
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell! {
        
        let cell = tabela.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as TarefasTableViewCell
        
        configurandoCell(cell, atIndexPath: indexPath)
        
        return cell
        
    }
    
    
    
    
    
    func configurandoCell(cell: TarefasTableViewCell, atIndexPath indexPath: NSIndexPath) {
        
        //let tarefa = tarefas[indexPath.row] usado antes do banco
        
        let tarefa = tarefas.fetchedObjects![indexPath.row] as Tarefas
        cell.textLabel?.text = tarefa.name
        
    }
    
    
    
    
    //UITextFieldDelegate entrada com enter(Return)
    func textFieldShouldReturn(textField: UITextField) -> Void {
        
        addTarefa()
        
    }
    
    
    //Deleta um item da lista
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
        //tarefas.removeAtIndex(indexPath.row) usado antes do banco de dados
            
        contexto?.deleteObject(tarefas.objectAtIndexPath(indexPath) as NSManagedObject)
            salvarContexto()
        //tabela.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic) usado antes do banco de dados
        }
        
    }
    
    //NSFetchedResultsControllerDelegate chamado ao alterar um objeto
    func controller(controller: NSFetchedResultsController, didChangeObject object: AnyObject, atIndexPath indexPath: NSIndexPath, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath) {
        
        switch type {
            case NSFetchedResultsChangeType.Insert:
            self.tabela.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
            case NSFetchedResultsChangeType.Delete:
            self.tabela.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            case NSFetchedResultsChangeType.Update:
            self.configurandoCell(tabela.cellForRowAtIndexPath(indexPath)! as TarefasTableViewCell, atIndexPath: indexPath)
                default:
                    return
            
        }
    }
}

