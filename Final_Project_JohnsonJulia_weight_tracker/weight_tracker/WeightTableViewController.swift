//
//  WeightTableViewController.swift
//  weight_tracker
//
//  Created by Julia Parker on 6/21/23.
//

import UIKit

class WeightTableViewController: UITableViewController {
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.leftBarButtonItem = editButtonItem

     
        
        if let savedWeight = Weight.loadFromFile() {
            WeightDateController.shared.weightDate = savedWeight
        } else {
            WeightDateController.shared.weightDate = []
        }
        
        self.navigationController?.tabBarItem.badgeValue = nil
    
      
    
     

    }
//

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//       
       
        tableView.reloadData()
        self.navigationController?.tabBarItem.badgeValue = nil
        
        
    }
    
    
    
    
    
    
    @IBSegueAction func addWeightEntry(_ coder: NSCoder) -> AddWeightViewController? {
        return AddWeightViewController(coder: coder)
    }
    
    
    
    
    
    
    @IBAction func unwindToWeightTable(_ segue: UIStoryboardSegue) {
        guard
            let addWeightViewController = segue.source as? AddWeightViewController,
            let _ = addWeightViewController.weight
        else { return}
        
    }
    
    
    

    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return WeightDateController.shared.weightDate.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableWeight", for: indexPath)
        //Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "MM/dd/YY"

        // Convert Date to String
        let date = dateFormatter.string(from: WeightDateController.shared.weightDate[indexPath.row].date)
//
        var content = cell.defaultContentConfiguration()
        content.text = date
        content.secondaryText = WeightDateController.shared.weightDate[indexPath.row].weight
        cell.contentConfiguration = content
     
        
    
        
        

        return cell
        
    }
    
    // Update the cells title and detail title to reflect the date and weight from the input screen
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            WeightDateController.shared.weightDate.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
