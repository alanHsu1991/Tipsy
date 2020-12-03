//
//  ViewController.swift
//  Tipsy
//
//  Created by Alan Hsu on 2020/09/26.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var people = 2
    var totalBill = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonNumber = sender.currentTitle!
        let buttonNumberWithoutPercentage = String(buttonNumber.dropLast())
        let buttonWholeNumber = Double(buttonNumberWithoutPercentage)!
        tip = buttonWholeNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        people = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billPrice = String(billTextField.text!)
        
        if billPrice != "" {
            totalBill = Double(billPrice)!
            let splitResult = totalBill * (1 + tip) / Double(people)
            finalResult = String(format: "%.2f", splitResult)
        }
        
        print(finalResult)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalResult = finalResult
            destinationVC.people = people
            destinationVC.tip = tip
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    


}

