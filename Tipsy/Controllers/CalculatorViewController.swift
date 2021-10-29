//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var splitPrsnNmber: Double?
    var tipPct: Double?
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender.currentTitle! == "10%" {
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPct = 0.1
        } else if sender.currentTitle! == "20%" {
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipPct = 0.2
        }
        else {
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipPct = 0.0
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
     
        splitPrsnNmber = sender.value
        splitNumberLabel.text = String(format: "%.f", splitPrsnNmber ?? 2.0)
    }
    @IBAction func calculatePressed(_ sender: Any) {
        let initBill = Double(billTextField.text!)
        
        let billForOnePerson = (initBill! + (initBill! * tipPct!)) / splitPrsnNmber!
        
        print (billForOnePerson)
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

