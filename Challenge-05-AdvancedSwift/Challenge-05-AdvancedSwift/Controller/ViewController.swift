//
//  ViewController.swift
//  Challenge-05-AdvancedSwift
//
//  Created by Dimitar Stefanovski on 5/7/20.
//  Copyright © 2020 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tipCalculator = TipCalculator()
    
    @IBOutlet private weak var billTotal: UITextField!
    @IBOutlet private weak var splitBetween: UILabel!
    
    @IBAction private func splitBetweenStepperChanged(_ sender: UIStepper) {
        tipCalculator.setSplitBetween(value: sender.value)
        splitBetween.text = tipCalculator.getSplitBetween()
    }
    
    @IBAction private func tipSelectionPressed(_ sender: UIButton) {
        guard let selectedTipPercentage = sender.titleLabel?.text else {
            print("Handle nil button titles...")
            return
        }
        tipCalculator.setSelectedTip(string: selectedTipPercentage)
    }
    
    @IBAction private func calculatePressed(_ sender: UIButton) {
        tipCalculator.seBillTotal(value: billTotal.text)
        self.performSegue(withIdentifier: "showCalculation", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCalculation" {
            let destination = segue.destination as! CalculationViewController
            destination.tipCalculator = tipCalculator
        }
    }

}

