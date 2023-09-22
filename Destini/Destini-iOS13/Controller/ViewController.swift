//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var story = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cleanUpUI()
        updateUI()
    }
    
    // Update question and choices text
    func updateUI() {
        storyLabel.text = story.getStoryTitle()
        choice1Button.setTitle(story.getChoice1(), for: .normal)
        choice2Button.setTitle(story.getChoice2(), for: .normal)
    }
    
    // Determines next page to show based on which button was pressed
    @IBAction func choiceMade(_ sender: UIButton) {
        story.getDestination(button: sender.tag)
        updateUI()
    }
    
    // Simple function to properly align the text
    func cleanUpUI() {
        storyLabel.textAlignment = .center
        choice1Button.titleLabel?.textAlignment = .center
        choice2Button.titleLabel?.textAlignment = .center
    }
    
}

