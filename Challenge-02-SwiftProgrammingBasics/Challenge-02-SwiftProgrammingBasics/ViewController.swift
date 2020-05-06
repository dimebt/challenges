//
//  ViewController.swift
//  Challenge-02-SwiftProgrammingBasics
//
//  Created by Dimitar Stefanovski on 5/6/20.
//  Copyright © 2020 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var answers = [#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball1"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball5")]

    @IBOutlet private weak var imageAnswer: UIImageView!

    @IBAction private func askMeButtonPressed(_ sender: UIButton) {
        imageAnswer.image = answers.randomElement()
    }
    
}

