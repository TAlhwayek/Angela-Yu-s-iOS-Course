//
//  ViewController.swift
//  Tipsy
//
//  Created by Tony Alhwayek on 09/28/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var totalInput: UITextField!
    
    // Tip buttons
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    
    @IBOutlet var splitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func tipChanged(_ sender: UIButton) {
        // Dismiss keyboard
        totalInput.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        var percent = sender.currentTitle!
        percent = String(percent.dropLast())
        
        var tipAmount = Float(percent)!
        tipAmount = tipAmount / 100
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        // Dismiss keyboard
        totalInput.endEditing(true)
        // Get value from stepper and update label
        splitLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var total = 0
        
        if totalInput.text != nil {
            total = Int(totalInput.text!)!
        }
        
        
    }
}

