//  Categories.swift
//  TestAppCoreDataInitApp02

import UIKit
import CoreData

@objc(Categories)

class Categories: NSManagedObject {
    @NSManaged var name:String
    
    func name_plus() ->String {
        return self.name + "です"
    }
    
}