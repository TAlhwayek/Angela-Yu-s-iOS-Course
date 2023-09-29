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
        
        // Deselect all tip buttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // Highlight seleceted tip button
        sender.isSelected = true
        
        var percent = sender.currentTitle!
        percent = String(percent.dropLast())
        
        // Get tip amount
        if let percentString = sender.currentTitle?.dropLast(), let percent = Double(percentString) {
            tipAmount = percent / 100
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        // Dismiss keyboard
        totalInput.endEditing(true)
        // Get value from stepper and update label
        splitLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // Check for total amount
        // Alert user if total is empty/blank
        guard let totalString = totalInput.text, let total = Double(totalString) else {
            // Defined and present alert
            let emptyInputAC = UIAlertController(title: "Please enter a total", message: "You cannot split an empty bill!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            emptyInputAC.addAction(okButton)
            present(emptyInputAC, animated: true)
            // Return and do not calculate
            return
        }
        
        let split = Double(splitLabel.text ?? "2")
        
        // Calculate total per person and save as a string
        let totalPerPerson = String(format: "%.2f", (total + (total * tipAmount)) / split!)
        
        // Present next VC
        if let finalVC = storyboard?.instantiateViewController(withIdentifier: "FinalVC") as? FinalViewController {
            finalVC.total = totalPerPerson
            finalVC.people = Int(split!)
            let tipPct = Int(tipAmount * 100)
            finalVC.tipPct = "\(tipPct)%"
            present(finalVC, animated: true)
        }
        
    }
}

