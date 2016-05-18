//
//  ViewController.swift
//  stopwatch
//
//  Created by Sacchit Chadha  on 02/05/16.
//  Copyright © 2016 Sacchit Chadha . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var milliSeconds = 0
    var seconds = 0
    var minutes = 0
    var timeString: String = ""
    
    func result()
    {
        milliSeconds += 1
        if milliSeconds == 100
        {
            seconds += 1
            milliSeconds = 0
        }
        if seconds == 60
        {
            minutes += 1
            seconds = 0
        }
        let milliSecondsString = milliSeconds > 9 ? "\(milliSeconds)" : "0\(milliSeconds)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        timeString = minutesString + ":" + secondsString + ":" + milliSecondsString
        stopWatchLabel.text = timeString
        
    }
    @IBOutlet weak var stopWatchLabel: UILabel!

    @IBAction func start(sender: AnyObject)
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.result), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(sender: AnyObject)
    {
        timer.invalidate()
    }
    
    
    @IBAction func stop(sender: AnyObject)
    {
        timer.invalidate()
        stopWatchLabel.text = "00:00:00"
        milliSeconds = 0
        seconds = 0
        minutes = 0
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

