//  ViewController.swift
//  TestAppCoreDataInitApp02

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMasters()
        
        println("---------------")
        println(readData().count)
        println("---------------")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func readData() -> NSArray{
        println("readData ------------")
        let app: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let categoryContext: NSManagedObjectContext = app.managedObjectContext!
        let categoryRequest: NSFetchRequest = NSFetchRequest(entityName: "Categories")
        
        var results: NSArray! = categoryContext.executeFetchRequest(categoryRequest, error: nil)
        for data in results {
            println("------------")
            println(data.name)
            println(data)
            println("------------")
        }
        
        return results
    }
    
    
    func initMasters() {
        println("initMasters ------------")
        
        // plist の読み込み
        let path:String = NSBundle.mainBundle().pathForResource("categories", ofType: "plist")!
        
        var masterDataDictionary:NSDictionary = NSDictionary(contentsOfFile: path as String)!
        
        
        let app: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let categoryContext: NSManagedObjectContext = app.managedObjectContext!
        
        for(var i = 1; i<=masterDataDictionary.count; i++) {
            let index_name: String = "Category" + String(i)
            var item: AnyObject = masterDataDictionary[index_name]!

            
            let categoryEntity: NSEntityDescription! = NSEntityDescription.entityForName(
                "Categories",
                inManagedObjectContext: categoryContext
            )
            var new_data  = NSManagedObject(entity: categoryEntity, insertIntoManagedObjectContext: categoryContext)
            //new_data.name = item["name"] as String
            new_data.setValue(item["name"] as! String, forKey: "name")

            
            var error: NSError?
            categoryContext.save(&error)
        }
        
        
        println("------------")
    }
}

