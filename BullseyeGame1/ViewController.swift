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
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //actions and functions go here

    @IBAction func hitMeButton(sender: AnyObject) {
        //everything that happens on submit
        
        let message = "The value is \(currentValue)" + "\nThe target is \(targetValue)"
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .Alert)
        
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
        
    }
    
    func updateLabels() {
        
    }

}

