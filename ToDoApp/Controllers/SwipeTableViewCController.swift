//
//  SwipeTableViewCController.swift
//  ToDoApp
//
//  Created by Amjad Almuwallad on 24/05/2020.
//  Copyright © 2020 Amjad Almuwallad. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewCController: UITableViewController, SwipeTableViewCellDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //MARK: -  Swipe TableViewCell Delegate
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") {[weak self] action, indexPath in
            self?.deleteModel(at: indexPath)
            
        }
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    func deleteModel(at indexPath: IndexPath) {
        //Will be implanted in subclasses
    }
}
