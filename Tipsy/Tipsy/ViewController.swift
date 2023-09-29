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
    
    var tipAmount: Double = 0.1
    
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
        
        tipAmount = Double(percent)!
        tipAmount = tipAmount / 100
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        // Dismiss keyboard
        totalInput.endEditing(true)
        // Get value from stepper and update label
        splitLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var total = 0.0
        let split = Double(splitLabel.text!)
        
        // Check for empty total amount
        if totalInput.text != "" {
            total = Double(totalInput.text!)!
        }
        
        // Calculate total per person and save as a string
        let totalPerPerson = String(format: "%.2f", (total + (total * tipAmount)) / split!)
        print(totalPerPerson)
        
        // Present next VC
        if let finalVC = storyboard?.instantiateViewController(withIdentifier: "FinalVC") as? FinalViewController {
            finalVC.total = totalPerPerson
            finalVC.people = Int(split!)
            var tipPct = String(Int(tipAmount * 100))
            tipPct = tipPct + "%"
            finalVC.tipPct = tipPct
            present(finalVC, animated: true)
        }
        
    }
}

