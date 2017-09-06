//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Matt Giovanniello on 9/5/17.
//  Copyright © 2017 Matt Giovanniello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func messageButton(_ sender: UIButton) {


        let messages = ["You are awesome!", "You are great!", "You are fantastic!", "When the Genius Bar needs help, they call you!", "You are da bomb!"]
        
        var newIndex = -1
        
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
        } while index == newIndex
        
        index = newIndex
        
        messageLabel.text = messages[index]
    }
        
        
        
        
/*
        var myUInt = arc4random_uniform(UInt32(messages.count))
        
        messageLabel.text = (messages[Int(myUInt)])
    }
 */

        
    
        
/*
 let message1 = "You are awesome!"
 let message2 = "You are great!"
 let message3 = "You are fantastic!"
 
 if messageLabel.text == message1 {
    messageLabel.text = message2
 }
 else if messageLabel.text == message2 {
    messageLabel.text = message3
 }
 else {
    messageLabel.text = message1
 }
}
 */


}
