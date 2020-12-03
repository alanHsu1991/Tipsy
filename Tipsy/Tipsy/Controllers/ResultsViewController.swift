//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Alan Hsu on 2020/09/16.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var finalResult = "0.0"
    var people = 2
    var tip = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = finalResult
        
        let tipWithPercent = String(format: "%.0f", tip * 100)
        settingsLabel.text = "Split between \(people) people, with \(tipWithPercent)% tip"
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
