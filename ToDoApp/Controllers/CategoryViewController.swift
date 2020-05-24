//
//  CategoryViewController.swift
//  ToDoApp
//
//  Created by Amjad Almuwallad on 24/05/2020.
//  Copyright © 2020 Amjad Almuwallad. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: SwipeTableViewCController {
    
    let realm = try! Realm()
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        loadCategories()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
        return cell
    }
    
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ToDoViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            dest.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    
    override func deleteModel(at indexPath: IndexPath) {
        super.deleteModel(at: indexPath)
        if let cateogryToDelete  = categories?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(cateogryToDelete)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        
        var myTextFiled = UITextField()
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) {[weak self] (_) in
            let newCatogry = Category()
            newCatogry.name = myTextFiled.text!
            self?.save(category: newCatogry)
        }
        alert.addAction(action)
        alert.addTextField { (textFiled) in
            textFiled.placeholder = "Add a new category"
            myTextFiled = textFiled
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}
