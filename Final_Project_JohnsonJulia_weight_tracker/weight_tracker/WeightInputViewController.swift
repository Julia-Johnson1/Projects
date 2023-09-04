//
//  ViewController.swift
//  weight_tracker
//
//  Created by Julia Parker on 4/9/23.
//

import UIKit
@MainActor
class InputViewController: UIViewController, UITextFieldDelegate {
    

   
    
    
    @IBOutlet var currentDateLabel: UILabel!
    
    @IBOutlet var weightTextField: UITextField!

    @IBOutlet var submitButtonTapped: UIButton!
    
    


    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        weightTextField.delegate = self
        let today = Date()
        let month = Calendar.current.component(.month, from: today)
        let date = Calendar.current.component(.day, from: today)
        currentDateLabel.text = "\(Calendar.current.monthSymbols[month-1]) \(date)"
       
    }
    
    
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        // takes today's date and the input from textfield and appends to the weightDate array
        let todayDate = Date()
        guard let pounds = weightTextField.text else { return }
        
       let todaysWeight = Weight(date: todayDate, weight: pounds)
        
        WeightDateController.shared.weightDate.append(todaysWeight)
        
        
        tabBarController?.tabBar.items?[1].badgeValue = "+"
        
        clearText()
    
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        weightTextField.resignFirstResponder()
        return true
    }
    
    func clearText() {
        weightTextField.text = ""
    }
    
   }



