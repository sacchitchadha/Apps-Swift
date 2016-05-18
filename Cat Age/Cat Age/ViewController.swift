//
//  ViewController.swift
//  Cat Age
//
//  Created by Sacchit Chadha  on 25/04/16.
//  Copyright © 2016 Sacchit Chadha . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catAgeField: UITextField!
    
    
    @IBOutlet weak var ResultField: UILabel!
    
    
    @IBAction func calcResult(sender: AnyObject)
    {
        var catAge = Int(catAgeField.text!)!
        catAge = catAge * 7
        ResultField.text = "Your cat's age in human years is \(catAge)"
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

