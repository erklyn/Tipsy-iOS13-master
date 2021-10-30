//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Utku enes Gürsel on 29.10.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var calculatedBill: String?
    var tipPercentage: String?
    var splitPerson: String?
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = calculatedBill ?? "0"
        settingLabel.text = "Split between " + (splitPerson ?? "2") + " ,with " + (tipPercentage ?? "%20") + " tip."
        
        
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
            
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
   

}
