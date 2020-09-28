//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
    var secondsRemaining = 0 // any value, just to make the var
    let eggTime: [String : Int] = ["Soft": 5, "Medium": 420, "Hard": 720]
    var timer = Timer() //created to stop the Timer while button pressed (line 25)
    var player: AVAudioPlayer!
    
   
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label1: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() //stop the timer from line 34
        let hardness = sender.currentTitle!
        label1.text = hardness
        
        //print(eggTime[hardness]!)
        
        let count = eggTime[sender.currentTitle!]
        secondsRemaining = count!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            //1.0 timer update every sec, it must repeat till 0,
            
            if self.secondsRemaining > 0 {
                print ("\(self.secondsRemaining) seconds")
                self.progressBar.progress = 1.0-(Float(self.secondsRemaining) / Float(self.eggTime[sender.currentTitle!]!))
                self.secondsRemaining -= 1
            } else {
                //print (self.secondsRemaining)
                self.timer.invalidate()
                self.label1.text = "DONE"
                self.progressBar.progress = 1.0
                playSound(soundName: "alarm_sound")
            }
                
        }
         
        func playSound(soundName: String) {
            let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
/*
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else if hardness == "Hard" {
            print(hardTime)
        }
*/
/*
        switch hardness {
            
        case "Soft":
            print(eggTime["Soft"])
            
        case "Medium":
            print(eggTime["Medium"])
            
        case "Hard":
            print(eggTime["Hard"])

        default:
            print("Error")
            
        }
 */
    }
    

}
