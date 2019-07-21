//
//  ViewController.swift
//  shoppingList
//
//  Created by Asim on 7/21/19.
//  Copyright © 2019 Asim Samuel. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAnItem))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(cleatList))
       
    }
    
    
    @objc func addAnItem() {
        let ac = UIAlertController(title: "Add an Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Add", style: .default) { [unowned ac] _ in
            
        let answer = ac.textFields![0]
        self.submit(answer.text!)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ item: String) {
   shoppingList.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
  
        
        }
    
    @objc func cleatList() {
        
        shoppingList.removeAll()
        
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return shoppingList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }


}

