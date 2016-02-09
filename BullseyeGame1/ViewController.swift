//
//  ViewController.swift
//  BullseyeGame1
//
//  Created by Kate Simmons on 2/5/16.
//  Copyright © 2016 Kate Simmons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //store values
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 1
    
    //outlets go here
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startNewRound()
        updateLabels()
        
        //custom design for slider goes here
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //actions and functions go here

    @IBAction func hitMeButton(sender: AnyObject) {
        //everything that happens on submit
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        //algorithm for points calculations
        if difference == 0 {
            title = "Perfect!"
            points += 100
        }
        else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        }
        else if difference < 10 {
            title = "Not quite"
        }
        else {
            title = "Not even close!"
        }
        
        
        //score counter
        score = score + points
        //print("points: \(points) and score: \(score)")
        
        //respons message
        let message = "The value is \(currentValue)" + "\nThe target is \(targetValue)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
        
    }
    
    @IBAction func sliderAction(sender: UISlider) {
        //assign slider value to  current value variable
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        
        //round counter
        round += 1 //same as round = round + 1
        
        //generate random number
        targetValue = 1 + Int(arc4random_uniform(100))
        
        //create current value for slider
        currentValue = 50
        
        //slider value update
        slider.value = Float(currentValue)
        
    }
    
    func updateLabels() {
        
        //update labels
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    @IBAction func startOver(sender: AnyObject) {
        startNewRound()
        updateLabels()
        
        //core animation
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        //run the animation
        view.layer.addAnimation(transition, forKey: nil)
    }


}

