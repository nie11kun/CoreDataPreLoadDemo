//
//  MenuTableViewController.swift
//  coreDataPreloadDemo
//
//  Created by Marco Nie on 27/07/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit
import CoreData

class MenuTableViewController: UITableViewController {

    var menuItems = [MenuItem]()
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath) as! FoodTableViewCell
        
        let menuItem = self.menuItems[indexPath.row]
        cell.name.text = menuItem.name
        cell.detail.text = menuItem.detail
        cell.price.text = String(menuItem.price)
        cell.price.text?.append("$")
        
        // Configure the cell...

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MenuItem")
            do {
                menuItems = try managedObjectContext.fetch(fetchRequest) as! [MenuItem]
                let menuItem = menuItems[indexPath.row]
                managedObjectContext.delete(menuItem)
                
                menuItems.remove(at: indexPath.row)
            } catch {
                print("error")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "DetailMenuItem" {
            if let detailMenuItemViewContriller = segue.destination as? DetailMenuItemViewController,
            let cell = sender as? UITableViewCell,
                let indexPath = self.tableView.indexPath(for: cell) {
                detailMenuItemViewContriller.index = indexPath.row
            }
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let managedObjectContext = self.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MenuItem")
        do {
            self.menuItems = try managedObjectContext.fetch(fetchRequest) as! [MenuItem]
        } catch {
            print("error")
        }
        tableView.reloadData()
    }
    
}
