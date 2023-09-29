//
//  FinalViewController.swift
//  Tipsy
//
//  Created by Tony Alhwayek on 9/28/23.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var configLabel: UILabel!
    
    var total: String!
    var people: Int!
    var tipPct: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        configLabel.text = "Split between \(people!) people, with \(tipPct!) tip."

    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
