//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Tony Alhwayek on 24/09/2023.
//

import UIKit

class CalculateViewController: UIViewController {

    // Slider outlets
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    
    // Label outlets
    @IBOutlet var heightValueLabel: UILabel!
    @IBOutlet var weightValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Slider functions
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightValueLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightValueLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        // BMI = W/H^2
        let BMI = weight / pow(height, 2)
        
        if let resultsVC = storyboard?.instantiateViewController(withIdentifier: "ResultsVC") as? ResultsViewController {
            resultsVC.BMI = BMI
            self.present(resultsVC, animated: true)
        }
    }
}

