//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    // Timer for counting down
    // Audio player for playing sound on timer completion
    var timer: Timer?
    var player: AVAudioPlayer?
    // Store time for timer
    var timerValue: Double = 0.0
    
    @IBAction func eggPressed(_ sender: UIButton) {
        timer?.invalidate()
        player?.stop()
        
        switch sender.tag {
        case 0:
            timerValue = 300
        case 1:
            timerValue = 420
        case 2:
            timerValue = 720
        default:
            timerValue = 300
        }
        
        // Start timer based on which mode the user selected
        timer = Timer.scheduledTimer(timeInterval: timerValue, target: self, selector: #selector(timerFinished), userInfo: nil, repeats: false)
    }
    
    // Play audio when timer finishes
    @objc func timerFinished() {
        if let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                // Keep looping until user dismisses the alert
                player?.numberOfLoops = -1
                player!.play()
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        }
        
        // Something I added
        // Present an alert and let the alert stop the sound from continuing
        let timerFinishedAC = UIAlertController(title: "Timer done", message: "Enjoy your eggs!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            self.player?.stop()
        }
        timerFinishedAC.addAction(ok)
        present(timerFinishedAC, animated: true)
    }
}
