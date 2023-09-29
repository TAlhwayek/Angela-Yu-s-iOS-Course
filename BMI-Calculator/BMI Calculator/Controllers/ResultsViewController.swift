//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Tony Alhwayek on 9/28/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var resultsLabel: UILabel!
    @IBOutlet var adviceLabel: UILabel!
    
    // BMI brought in from previous view controller
    var BMI: Float!
    
    // Message shown under BMI
    var message = ["Eat more pies!", "Fit as a fiddle!", "Eat less pies!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (BMI < 18.5) {
            adviceLabel.text = message[0]
            resultsLabel.textColor = UIColor(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        } else if (BMI < 24.9) {
            adviceLabel.text = message[1]
            resultsLabel.textColor = UIColor(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        } else {
            adviceLabel.text = message[2]
            resultsLabel.textColor = UIColor(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
        
        // Present result in label
        resultsLabel.text = String(format: "%.1f", BMI!)
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
