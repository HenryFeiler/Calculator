//
//  ViewController.swift
//  Secret Calculator
//
//  Created by Henry Feiler on 6/13/20.
//  Copyright © 2020 Henry Feiler. All rights reserved.
//

import UIKit
import AVFoundation

class CalculatorViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false;
    var operation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func voiceButtonPushed(_ sender: UIButton) {
            let words: String = "\(String(describing: label.text!))"
            let utterance = AVSpeechUtterance(string: words)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
            utterance.rate = 0.5

            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
    
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
        label.text = String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
        performingMath = false
        }
        else {
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{

        previousNumber = Double(label.text!)!

        if sender.tag == 12 { //Divide

        label.text = "/";

        }

        if sender.tag == 13 { //Multiply

        label.text = "x";

        }

        if sender.tag == 14 { //Subtract

        label.text = "-";

        }

        if sender.tag == 15 { //Add

        label.text = "+";

        }

        operation = sender.tag

        performingMath = true;

        }

        else if sender.tag == 16 {

        if operation == 12{ //Divide

        label.text = String(previousNumber / numberOnScreen)

        }

        else if operation == 13{ //Multiply

        label.text = String(previousNumber * numberOnScreen)

        }

        else if operation == 14{ //Subtract

        label.text = String(previousNumber - numberOnScreen)

        }

        else if operation == 15{ //Add

        label.text = String(previousNumber + numberOnScreen)

        }

        }

        else if sender.tag == 11{

        label.text = ""

        previousNumber = 0;

        numberOnScreen = 0;

        operation = 0;

        }

        }
    }
    
    


