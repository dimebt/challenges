//
//  ViewController.swift
//  Chalenge-04-AppDesignPattern
//
//  Created by Dimitar Stefanovski on 5/7/20.
//  Copyright © 2020 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var story: UILabel!
    @IBOutlet private weak var choice1: UIButton!
    @IBOutlet private weak var choice2: UIButton!    
    
    var storyBrain = StoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        story.text = storyBrain.getTitle()
        choice1.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2.setTitle(storyBrain.getChoice2(), for: .normal)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        guard let choiceText = sender.titleLabel?.text else {
            print("Choice button does not have a title text")
            return
        }
        storyBrain.nextStory(choice: choiceText)
        updateUI()
    }
    
}

