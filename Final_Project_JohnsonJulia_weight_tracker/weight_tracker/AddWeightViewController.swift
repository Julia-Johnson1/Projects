//
//  AddWeightViewController.swift
//  weight_tracker
//
//  Created by Julia Parker on 7/5/23.
//

import UIKit

class AddWeightViewController: UIViewController {
    
    var weight: Weight?
    
    var dates = Date()
    
    @IBOutlet var dateTextField: UITextField!
    
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var saveButton: UIButton!
    
    @IBOutlet var datePickerOutlet: UIDatePicker!
    
    @IBOutlet var selectedDateLabel: UILabel!
    
    
//    init?(coder: NSCoder, weight: Weight) {
//        self.weight = weight
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dateValueChanged(_ sender: Any) {
        updateViews()
        dates = datePickerOutlet.date
    }
    
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
//        let dateString = dateTextField.text ?? ""
        let dateFormatter = DateFormatter()
        
        // Set Date Format
        dateFormatter.dateFormat = "MM/DD/YY"
//        let date = dateFormatter.date(from: dates)
        
        // Convert Date to String
        
        guard let addWeight = weightTextField.text else {return}
        let weight = Weight(date: dates, weight: addWeight)
        
        WeightDateController.shared.weightDate.append(weight)
        
       
        
        performSegue(withIdentifier: "unwindToTable", sender: self)
    }
    
    
    func updateViews() {
        selectedDateLabel.text = datePickerOutlet.date.formatted(date: .abbreviated, time: .omitted)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
