//
//  Item.swift
//  ToDoApp
//
//  Created by Amjad Almuwallad on 24/05/2020.
//  Copyright © 2020 Amjad Almuwallad. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title:String = ""
    @objc dynamic var done:Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
