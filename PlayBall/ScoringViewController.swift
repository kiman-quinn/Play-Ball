//
//  ScoringViewController.swift
//  PlayBall
//
//  Created by Kim-An Quinn on 12/8/19.
//  Copyright © 2019 Kim-An Quinn. All rights reserved.
//

import UIKit

class ScoringViewController: UIViewController {

    @IBOutlet weak var abLabel: UILabel!
    @IBOutlet weak var paLabel: UILabel!
    @IBOutlet weak var bbLabel: UILabel!
    @IBOutlet weak var qabLabel: UILabel!
    @IBOutlet weak var kLabel: UILabel!
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var singleLabel: UILabel!
    @IBOutlet weak var doubleLabel: UILabel!
    @IBOutlet weak var tripleLabel: UILabel!
    @IBOutlet weak var hrLabel: UILabel!
   
    @IBOutlet weak var baLabel: UILabel!
    @IBOutlet weak var xbhLabel: UILabel!
    @IBOutlet weak var obpLabel: UILabel!
    @IBOutlet weak var slgLabel: UILabel!
    @IBOutlet weak var qpaLabel: UILabel!
    
    
    @IBOutlet weak var abStepper: UIStepper!
    @IBOutlet weak var paStepper: UIStepper!
    @IBOutlet weak var bbStepper: UIStepper!
    @IBOutlet weak var qabStepper: UIStepper!
    @IBOutlet weak var kOStepper: UIStepper!
    @IBOutlet weak var hStepper: UIStepper!
    @IBOutlet weak var singleStepper: UIStepper!
    @IBOutlet weak var doubleStepper: UIStepper!
    @IBOutlet weak var tripleStepper: UIStepper!
    @IBOutlet weak var hrStepper: UIStepper!

    
    var ba = 0.0
    var obp = 0.0
    var slg = 0.0
    var xbh = 0.0 // extra base hits
    var qpa = 0.0 // quality at bats per pa
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUserInterface()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    
    func calcStats(){
        ba = Double(hStepper.value) / Double(abStepper.value)
        obp = Double(hStepper.value + bbStepper.value) / Double(paStepper.value)
        var totalBases = Double(singleStepper.value + 2 * doubleStepper.value)
        totalBases +=  Double(3 * tripleStepper.value)
        totalBases += Double(4 * hrStepper.value)
        slg =  totalBases / Double(abStepper.value)
        xbh = Double(doubleStepper.value + tripleStepper.value + hrStepper.value)
        qpa = Double(qabStepper.value) / Double (paStepper.value)
    }
    
    func updateUserInterface(){
        baLabel.text = format(stepperVal: ba)
        obpLabel.text = format(stepperVal: obp)
        slgLabel.text = format(stepperVal: slg)
        xbhLabel.text = format(stepperVal: xbh)
        qpaLabel.text = format(stepperVal: qpa)
    }
    
    func format(stepperVal: Double) -> String {
        return String(format: "%.3f", stepperVal)
    }

    @IBAction func clearButtonPressed(_ sender: UIBarButtonItem) {
        abLabel.text = "0"
        paLabel.text = "0"
        bbLabel.text = "0"
        qpaLabel.text = "0"
        kLabel.text = "0"
        hLabel.text = "0"
        singleLabel.text = "0"
        doubleLabel.text = "0"
        tripleLabel.text = "0"
        hrLabel.text = "0"
        ba = 0.0
        obp = 0.0
        slg = 0.0
        xbh = 0.0
        qpa = 0.0
        updateUserInterface()
    }
    
    
    @IBAction func abStepperPressed(_ sender: UIStepper) {
        abLabel.text = String(Int(abStepper!.value))
        paStepper.value += 1
        
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func paStepperPressed(_ sender: UIStepper) {
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func bbStepperPressed(_ sender: UIStepper) {
        bbLabel.text = String(Int(bbStepper!.value))
        paStepper.value += 1
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func qabStepperPressed(_ sender: UIStepper) {
        qabLabel.text = String(Int(qabStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func kOStepperPressed(_ sender: UIStepper) {
        kLabel.text = String(Int(kOStepper!.value))
        abStepper.value += 1
        abLabel.text = String(Int(abStepper!.value))
        paStepper.value += 1
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func hStepperPressed(_ sender: UIStepper) {
        hLabel.text = String(Int(hStepper!.value))
        abStepper.value += 1
        abLabel.text = String(Int(abStepper!.value))
        paStepper.value += 1
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func singleStepperPressed(_ sender: UIStepper) {
        singleLabel.text = String(Int(singleStepper!.value))
        abStepper.value += 1
        hStepper.value += 1
        hLabel.text = String(Int(hStepper!.value))
        abLabel.text = String(Int(abStepper!.value))
        paStepper.value += 1
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func doubleStepperPressed(_ sender: UIStepper) {
        doubleLabel.text = String(Int(doubleStepper!.value))
        hStepper.value += 1
        hLabel.text = String(Int(hStepper!.value))
        abStepper.value += 1
        abLabel.text = String(Int(abStepper!.value))
        paStepper.value += 1
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func tripleStepperPressed(_ sender: UIStepper) {
        tripleLabel.text = String(Int(tripleStepper!.value))
        hStepper.value += 1
        hLabel.text = String(Int(hStepper!.value))
        abStepper.value += 1
        abLabel.text = String(Int(abStepper!.value))
        paStepper.value += 1
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    @IBAction func hrStepperPressed(_ sender: UIStepper) {
        hrLabel.text = String(Int(hrStepper!.value))
        hStepper.value += 1
        hLabel.text = String(Int(hStepper!.value))
        abStepper.value += 1
        abLabel.text = String(Int(abStepper!.value))
        paStepper.value += 1
        paLabel.text = String(Int(paStepper!.value))
        calcStats()
        updateUserInterface()
    }
    
    
}
