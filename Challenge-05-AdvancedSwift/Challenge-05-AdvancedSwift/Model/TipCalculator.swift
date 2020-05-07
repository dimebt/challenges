//
//  TipCalculator.swift
//  Challenge-05-AdvancedSwift
//
//  Created by Dimitar Stefanovski on 5/7/20.
//  Copyright © 2020 Dimitar Stefanovski. All rights reserved.
//

import Foundation

class TipCalculator {
    var billTotal: Float
    var selectedTip: Float
    var splitBetween: Int
    
    init(billTotal: Float = 0.0,
         selectedTip: Float = 0.0,
         splitBetween: Int = 2) {
        
        self.billTotal = billTotal
        self.selectedTip = selectedTip
        self.splitBetween = splitBetween
    }
    
    func seBillTotal(value: String?) {
        guard let value = value, let total = Float(value) else {
            return
        }
        billTotal = total
    }
    
    func setSelectedTip(string: String) {
        switch string {
        case "10%":
            selectedTip = 10
        case "20%":
            selectedTip = 20
        default:
            selectedTip = 0
        }
    }
    
    func setSplitBetween(value: Double) {
        splitBetween = Int(value)
    }
    
    func getSplitBetween() -> String {
        return String(splitBetween)
    }
    
    func calculate() -> Float {
        return (billTotal + (billTotal * getRatio(from: selectedTip))) / Float(splitBetween)
    }
    
    //  MARK: - Private methods
    
    private func getRatio(from percentage: Float) -> Float {
        return percentage / 100        
    }
}
