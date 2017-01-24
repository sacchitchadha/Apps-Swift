//
//  ViewController.swift
//  weather app
//
//  Created by Sacchit Chadha  on 20/05/16.
//  Copyright © 2016 Sacchit Chadha . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBAction func submitButton(_ sender: AnyObject)
    {
        var valueRetrieved = false
        let possibleUrl = URL(string: "http://www.weather-forecast.com/locations/" + textField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest")
        if let url = possibleUrl
        {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let urlContent = data
                {
                    let webContent = NSString(data: urlContent, encoding: String.Encoding.utf8.rawValue)
                    let arr = webContent!.components(separatedBy: "3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    if arr.count > 1
                    {
                        let arr2 = arr[1].components(separatedBy: "</span>")
                        if arr2.count > 1
                        {
                            valueRetrieved = true
                            let arr3 = arr2[0].replacingOccurrences(of: "&deg;", with: "º")
                            DispatchQueue.main.async(execute: {
                                self.displayLabel.text = arr3
                                self.displayLabel.textColor = UIColor(netHex:0xE57466)
                            })
                        }
                    }
                }
                if valueRetrieved == false
                {
                    self.displayLabel.text = "Error - Could not get weather for the specified city"
                    self.displayLabel.textColor = UIColor(netHex:0xE57466)
                }
            }) 
            task.resume()
        }
        else
        {
            self.displayLabel.text = "Error - Could not get weather for the specified city"
            self.displayLabel.textColor = UIColor(netHex:0xE57466)
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

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

