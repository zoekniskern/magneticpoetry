//
//  WordTypeVC.swift
//  Poeterator
//
//  Created by Student on 2/17/19.
//  Copyright © 2019 Zoe Kniskern (RIT Student). All rights reserved.
//

import UIKit

class WordTypeVC: UITableViewController {
    
    //MARK: - Initialization -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    // MARK: - Table view data source
    //number of sections
    //handled dynamically
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //number of rows in section
    //handled dynamically
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appData.shared.Alltypes.count
    }

    //cell for row at
    //loaded from types array
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Typecell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = appData.shared.Alltypes[indexPath.row].type
        return cell
    }
    
    //MARK: - SELECTION CHOICES -
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appData.shared.selectedType = appData.shared.Alltypes[indexPath.row].type
        appData.shared.selectedWords = appData.shared.Alltypes[indexPath.row].words
        //print(selectedType)
    }
    
    //MARK: - DISMISS -
    // dismiss table selection
    @IBAction func cancelTapped(){
        dismiss(animated: true, completion: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
