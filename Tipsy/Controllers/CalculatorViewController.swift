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
    var initBill: Double?
    var billForOnePerson: Double?
    var percentageText: String?
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender.currentTitle! == "10%" {
            percentageText = sender.currentTitle
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPct = 0.1
        } else if sender.currentTitle! == "20%" {
            percentageText = sender.currentTitle
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipPct = 0.2
        }
        else {
            percentageText = sender.currentTitle
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
        initBill = Double(billTextField.text!)
        
        billForOnePerson = (initBill! + (initBill! * tipPct!)) / splitPrsnNmber!
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.calculatedBill = String(format: "%.1f" , billForOnePerson ?? 0.0)
            destinationVC.splitPerson = splitNumberLabel.text
            destinationVC.tipPercentage = percentageText
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

