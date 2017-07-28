//
//  DetailMenuItemViewController.swift
//  coreDataPreloadDemo
//
//  Created by Marco Nie on 28/07/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit
import CoreData

class DetailMenuItemViewController: UIViewController, UITextFieldDelegate {
    
    var index: Int!
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var detail: UITextView!
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MenuItem")
        do {
            let menuItems = try managedObjectContext.fetch(fetchRequest) as! [MenuItem]
            let menuItem = menuItems[index]
            menuItem.name = name.text
            menuItem.detail = detail.text
            menuItem.price = (price.text! as NSString).doubleValue
            
            do {
                try managedObjectContext.save()
            } catch {
                print("error")
            }
            
        } catch {
            print("error")
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        price.delegate = self
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MenuItem")
        do {
            let menuItems = try managedObjectContext.fetch(fetchRequest) as! [MenuItem]
            let menuItem = menuItems[index]
            self.title = menuItem.name
            name.text = menuItem.name
            detail.text = menuItem.detail
            price.text = String(menuItem.price)
            
            do {
                try managedObjectContext.save()
            } catch {
                print("error")
            }
            
        } catch {
            print("error")
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
