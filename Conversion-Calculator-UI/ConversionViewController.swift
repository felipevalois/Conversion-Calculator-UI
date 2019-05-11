//
//  ConversionViewController.swift
//  Conversion-Calculator-UI
//
//  Created by Felipe Costa on 4/12/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    var inputNumber:Double? = nil
    var outputNumber:Double? = nil
    var inputUnit = ""
    var outputUnit = ""
    var conversionCase = 0
    var decimal = false

    struct Converter {
        var label : String
        var inputUnit : String
        var outputUnit : String
    }
    
    var converters: [Converter] = [Converter(label: "Farenheit to Celcius", inputUnit: "°F", outputUnit: "°C"),
                                   Converter(label: "Celcius to Farenheit", inputUnit: "°C", outputUnit: "°F"),
                                   Converter(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"),
                                   Converter(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi")]
    
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func converter(_ sender: UIButton) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Converter", preferredStyle: UIAlertController.Style.actionSheet)
        
        optionMenu.addAction(UIAlertAction(title: converters[0].label, style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.outputUnit = self.converters[0].outputUnit
            self.outputDisplay.text = self.outputDisplayText + self.outputUnit
            self.inputUnit = self.converters[0].inputUnit
            self.inputDisplay.text = self.inputDisplayText + self.inputUnit
            self.conversionCase = 1
            if self.inputNumber != nil {
                self.conversion()
            }
        }))
        
        optionMenu.addAction(UIAlertAction(title: converters[1].label, style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.outputUnit = self.converters[1].outputUnit
            self.outputDisplay.text = self.outputDisplayText + self.outputUnit
            self.inputUnit = self.converters[1].inputUnit
            self.inputDisplay.text = self.inputDisplayText + self.inputUnit
            self.conversionCase = 2
            if self.inputNumber != nil {
                self.conversion()
            }
        }))
        
        optionMenu.addAction( UIAlertAction(title: converters[2].label, style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.outputUnit = self.converters[2].outputUnit
            self.outputDisplay.text = self.outputDisplayText + self.outputUnit
            self.inputUnit = self.converters[2].inputUnit
            self.inputDisplay.text = self.inputDisplayText + self.inputUnit
            self.conversionCase = 3
            if self.inputNumber != nil {
                self.conversion()
            }
        }))
        
        optionMenu.addAction( UIAlertAction(title: converters[3].label, style: UIAlertAction.Style.default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.outputUnit = self.converters[3].outputUnit
            self.outputDisplay.text = self.outputDisplayText + self.outputUnit
            self.inputUnit = self.converters[3].inputUnit
            self.inputDisplay.text = self.inputDisplayText + self.inputUnit
            self.conversionCase = 4
            if self.inputNumber != nil {
                self.conversion()
            }
        }))
        
        self.present(optionMenu, animated: true, completion: nil)

    }

    
    var inputDisplayText: String = ""

    var outputDisplayText: String = ""
    
    @IBAction func numbers(_ sender: UIButton){
        if sender.tag > -1 && sender.tag < 10 { //numbers
            inputDisplayText.append(String(sender.tag))
        }
        if sender.tag == 10 { // decimal
            inputDisplayText.append(".")
            decimal = true
        }
        if sender.tag == 12 {//&& inputNumber != nil { //negative
            negative()
            conversion()
        }
        if sender.tag == 11 { //clear
            inputDisplay.text = "" + inputUnit
            inputDisplayText = ""
            inputNumber = nil
            outputDisplay.text = "" + outputUnit
            outputDisplayText = ""
            outputNumber = nil
            decimal = false
            return
        }

        inputDisplay.text = inputDisplayText + inputUnit
        inputNumber = Double(inputDisplayText)!
        conversion()
    }

    func negative() {
        if decimal {
            inputNumber = (inputNumber! * -1)
            inputDisplayText = String(inputNumber!)
            inputDisplay.text = inputDisplayText + inputUnit
        } else {
            inputNumber = (inputNumber! * -1)
            inputDisplayText = String(Int(inputNumber!))
            inputDisplay.text = inputDisplayText + inputUnit
        }
    }
    
    func conversion() {
        switch conversionCase{
            case 1: do{
                self.outputNumber = ((self.inputNumber! - 32) * 5/9)
            }
            case 2: do{
                self.outputNumber = ((self.inputNumber! * 9/5) + 32)
            }
            case 3: do {
                self.outputNumber = (1.60934 * self.inputNumber!)
            }
            case 4: do {
                self.outputNumber = (0.621371 * self.inputNumber!)
            }
            default: break
        }
        outputDisplayText = String(format: "%.2f", outputNumber!)
        outputDisplay.text = outputDisplayText + outputUnit
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inputUnit = self.converters[0].inputUnit
        self.outputUnit = self.converters[0].outputUnit
        self.outputDisplay.text = self.outputUnit
        self.inputDisplay.text = self.inputUnit
        conversionCase = 1
    }
    

}
