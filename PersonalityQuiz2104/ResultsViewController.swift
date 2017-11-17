//
//  ResultsViewController.swift
//  PersonalityQuiz2104
//
//  Created by Jet van den Berg on 16-11-17.
//  Copyright © 2017 Jet van den Berg. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // Outlet connections for result labels.
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    // Update view and results.
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }

    // Calculate results via dictionary.
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
        ?? 0) + 1
        }
        
        // Sort answers by frequency.
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        // Update labels.
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
