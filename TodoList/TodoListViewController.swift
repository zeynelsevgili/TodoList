//
//  ViewController.swift
//  TodoList
//
//  Created by Demo on 30.07.2018.
//  Copyright © 2018 RN. All rights reserved.
//

import UIKit

// main story de default gelen UIView i sildik. yerine sağ alttan tableViewController sürükledik. şimdi bunu bu sınıf ile bağlamak için UIViewController(default) sınıfını silip yerine "UITableViewController" ekliyoruz. sonra da sağ taraftan
// "ViewController" yazan dosyanın ismini "TodoListViewController" koyuyoruz(keyfi). sonrasıda aşağıdaki class ismini de anyı isimle değiştiriyoruz. En sonda da inspector kısmından class ismini değiştiriyoruz.
// neden delegate ve datasource u burada belirtmedik? Single subclassing diyor cevabı ama araştır.
class TodoListViewController: UITableViewController {
    

    
    let itemArray = ["1","iki","üç"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath yukarıdaki değişkendir.(current IndexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
        
    }
    
    //Mark - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // burada seçilen row un accessory kısmını checkmark yapıyoruz. eğer checkmark ise none ile uncheck yaptırıyoruz.
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none

        }else{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

