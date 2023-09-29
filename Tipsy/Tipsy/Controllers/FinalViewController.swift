//
//  FinalViewController.swift
//  Tipsy
//
//  Created by Tony Alhwayek on 9/28/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var configLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
