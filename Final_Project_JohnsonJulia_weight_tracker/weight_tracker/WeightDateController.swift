//
//  WeightDateController.swift
//  weight_tracker
//
//  Created by Julia Parker on 6/23/23.
//

import Foundation
import UIKit

class WeightDateController: NSObject {
    static let shared = WeightDateController()
    
    var weightDate: [Weight] = [Weight(date: Date(), weight: "156.6")] {
        
        didSet {
            Weight.saveToFile(weightDate: weightDate)
            
            
        }
        
        
    }
    
    
}


