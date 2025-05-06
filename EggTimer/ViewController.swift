//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!

    let eggTimes: Dictionary<String, Int> = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]
    
    var secondsRemaining: Int = 60
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        totalTime = 0
        secondsPassed = 0

        let hardness: String? = sender.currentTitle
        titleLabel.text =  hardness

        if hardness != nil {
            let time: Int? = eggTimes[hardness!]
            if time != nil {
                secondsRemaining = time!
                totalTime = time!
                timer = Timer.scheduledTimer(
                    timeInterval: 1.0,
                    target: self,
                    selector: #selector(updateTimer),
                    userInfo: nil,
                    repeats: true
                )
                print("Ovo \(hardness!) = \(time!) segundos")
            } else {
                print("Não foi encontrado o tempo.")
            }
        } else {
            print("O tipo de ovo está vazio.")
        }
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            secondsPassed += 1
            let percent: Float = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percent
            print("\(secondsRemaining) segundos")
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    

}
