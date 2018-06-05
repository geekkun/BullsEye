//
//  ViewController.swift
//  BullsEye
//
//  Created by A on 05/06/2018.
//  Copyright © 2018 Alex Kuznetsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var targetVal = 0
    var score = 0
    var round = 1
    
     @IBAction func reset (){
        score = 0
        round = 1
        startRound()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        startRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert(){
        let diff = abs(targetVal-currentValue)
        let points = 100 - diff
        
        score += points
        round += 1
        
        let message = "You scored \(points)"
        
        let alert = UIAlertController(title: "Hello, world!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {action in self.startRound()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
//        startRound()
    }
    
    
    func startRound(){
        
        targetVal = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetVal)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

