//
//  AddMenuItemViewController.swift
//  coreDataPreloadDemo
//
//  Created by Marco Nie on 28/07/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit
import CoreData

class AddMenuItemViewController: UIViewController, UITextFieldDelegate {
    
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        let context = NSEntityDescription.insertNewObject(forEntityName: "MenuItem", into: managedObjectContext) as! MenuItem
        context.name = nameTextField.text
        context.detail = detailTextView.text
        context.price = (priceTextField.text! as NSString).doubleValue
        
        do {
            try managedObjectContext.save()
        } catch {
            print("can not save")
        }

        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        priceTextField.delegate = self

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
