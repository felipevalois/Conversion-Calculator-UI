//
//  ConversionViewController.swift
//  Conversion-Calculator-UI
//
//  Created by Felipe Costa on 4/12/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    struct Converter {
        var label : String
        var inputUnit : String
        var outputUnit : String
    }
    
    var converters: [Converter] = [Converter(label: "Farenheit to Celcius", inputUnit: "°F", outputUnit: "°C"),
                                   Converter(label: "Celcius to Farenheit", inputUnit: "°C", outputUnit: "°F"),
                                   Converter(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"),
                                   Converter(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi")]
    
    var currentConverter: Converter?
    
    
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func converter(_ sender: UIButton) {
        let optionMenu = UIAlertController(title: nil, message: "Select a Converter", preferredStyle: .actionSheet)
        for converter in converters {
            optionMenu.addAction(UIAlertAction(title: converter.label, style: .default) {
                (action:UIAlertAction!) in
                self.changeMenu(to: converter)
            })
        }
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func changeMenu(to converter: Converter){
        outputDisplay.text = converter.outputUnit
        inputDisplay.text = converter.inputUnit
        self.currentConverter = converter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputDisplay.text = converters[0].outputUnit
        inputDisplay.text = converters[0].inputUnit
    }
    

}
