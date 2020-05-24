//
//  Category.swift
//  ToDoApp
//
//  Created by Amjad Almuwallad on 24/05/2020.
//  Copyright © 2020 Amjad Almuwallad. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name:String = ""
    let items = List<Item>()
}
