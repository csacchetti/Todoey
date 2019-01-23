//
//  ViewController.swift
//  Todoey
//
//  Created by Carlo Sacchetti on 23/01/2019.
//  Copyright © 2019 Carlo Sacchetti. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    //MARK: TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //Creo la variabile di testo che mi permette di recuperare ciò che viene scritto nel campo di testo e ampliare lo "scope" che sarebbe limitato alla closure dove è digitato
        var textField = UITextField()
        
        //Creiamo l'Alert
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        //Aggiungiamo l'Azione
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            //Aggiungo il testo che ho scritto nel campo di testo alla variabile con "scope" maggiore all'Array con le varie items"
            self.itemArray.append(textField.text!)
            
            //Aggiorno la vista della TableView
            self.tableView.reloadData()
        }
        
        //Aggiungiamo il textField all'Alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        //Aggiungiamo il bottone sopra creato alla finestra di Alert
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

