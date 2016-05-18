//
//  ViewController.swift
//  prime number checker
//
//  Created by Sacchit Chadha  on 27/04/16.
//  Copyright © 2016 Sacchit Chadha . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userNumber: UITextField!
    
    
    @IBOutlet weak var resultField: UILabel!
    
    
    @IBAction func guessButton(sender: AnyObject)
    {
        if let n = Int(userNumber.text!)
        {
            var isPrime = true
            if n == 0 || n == 1
            {
                resultField.text = "\(n) is neither prime nor composite"
            }
            if n >= 2
            {
                for i in 2 ..< n
                {
                    if n % i == 0
                    {
                        isPrime = false
                    }
                }
            }
            
            if isPrime == false
            {
                resultField.text = "\(n) is not a prime number"
            }
            else
            {
                if n != 0 && n != 1
                {
                    resultField.text = "\(n) is a prime number"
                }
            }
        }
        else
        {
            resultField.text = "Please enter a whole number"
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

