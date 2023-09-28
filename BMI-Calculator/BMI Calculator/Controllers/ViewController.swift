//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Tony Alhwayek on 24/09/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heightValueLabel: UILabel!
    @IBOutlet var weightValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValueLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValueLabel.text = "\(String(format: "%.0f", sender.value))Kg"
    }
    
    
    
}

