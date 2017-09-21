//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Matt Giovanniello on 9/5/17.
//  Copyright © 2017 Matt Giovanniello. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var messageLabel: UILabel!
    
    var index = -1
    var imageNumber = -1
    let numberOfImages = 10
    let numberOfSounds = 5
    var soundNumber = -1
    var awesomePlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound =  NSDataAsset(name: soundName) {
            // check if sound.data is sound file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }
            catch {
                print("Error: data in \(soundName) can't be played as a sound")
            }
        }
        else {
            print("Error: file \(soundName) didn't load")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
       var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            // stop playing
            awesomePlayer.stop()
        }
    }
    
	@IBOutlet weak var awesomeImage: UIImageView!
    @IBAction func messageButton(_ sender: UIButton) {
        
        

        let messages = ["You are awesome!", "You are great!", "You are fantastic!", "When the Genius Bar needs help, they call you!", "You are da bomb!"]
        
        // show message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        // show image
        awesomeImage.isHidden = false // not needed unless "Hidden" is checked in Attributes inspector
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        if soundSwitch.isOn == true {
            // get random number to choose sound file
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            // play a sound
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
    }
    
}
