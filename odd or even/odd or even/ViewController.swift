//
//  ViewController.swift
//  odd or even
//
//  Created by Sacchit Chadha  on 27/04/16.
//  Copyright © 2016 Sacchit Chadha . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserGuessField: UITextField!
    
    
    @IBOutlet weak var OutputDisplay: UILabel!
    
    @IBAction func GuessButton(sender: AnyObject)
    {
        let guessNumber = Int(arc4random_uniform(1000))
        if guessNumber % 2 ==  0 && UserGuessField.text == "even"
        {
            OutputDisplay.text = "You are right! the number was \(guessNumber)"
        }
        else if guessNumber % 2 == 1 && UserGuessField.text == "odd"
        {
            OutputDisplay.text = "You are right! the number was \(guessNumber)"
        }
        else
        {
            OutputDisplay.text = "Sorry you are wrong, the number was \(guessNumber)"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

