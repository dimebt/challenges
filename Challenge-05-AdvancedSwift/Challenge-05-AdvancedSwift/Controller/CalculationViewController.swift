//
//  CalculationViewController.swift
//  Challenge-05-AdvancedSwift
//
//  Created by Dimitar Stefanovski on 5/7/20.
//  Copyright © 2020 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {
    
    var tipCalculator: TipCalculator?
    
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var splitDesription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalPerPerson.text = String(format: "%0.2f", tipCalculator?.calculate() ?? 0.0)
        self.splitDesription.text = "Split between \(tipCalculator?.getSplitBetween() ?? "2") people, with \(String(Int(tipCalculator?.selectedTip ?? 0)))% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
