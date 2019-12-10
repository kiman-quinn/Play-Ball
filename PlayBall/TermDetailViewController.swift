//
//  TermDetailViewController.swift
//  PlayBall
//
//  Created by Kim-An Quinn on 12/9/19.
//  Copyright © 2019 Kim-An Quinn. All rights reserved.
//

import UIKit

class TermDetailViewController: UIViewController {

    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var abbreviationLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var term: String!
    var abbreviation: String!
    var definition: String!
    
    
    override func viewDidLoad() {
        termLabel.text = term
        abbreviationLabel.text = abbreviation
        definitionLabel.text = definition
        
        super.viewDidLoad()
    }
    

}
