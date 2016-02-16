//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Yuchi on 9/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit





class ConversionViewController: UIViewController {
   
//    override func viewDidLoad(){
//        //always call the super implementation of viewDidLoad
//        super.viewDidLoad()
//        print("ConversionViewController loaded its view")
//        
//    }
    
//    var r: CGFloat
//    var g: CGFloat
//    var b: CGFloat
//
//    
//    func getRandomColor() -> UIColor{
//        
//        r = CGFloat(drand48())
//        
//        g = CGFloat(drand48())
//        
//        b = CGFloat(drand48())
//        
//        return UIColor(red:r, green:g, blue:b, alpha: 1.0)
//        print(r + "  " + g + "  " + b)
//        
//    }
//    
//    
//    
//    override func viewWillAppear(animated: Bool) {
//                super.viewWillAppear(animated)
//                self.view.backgroundColor = UIColor(red:r, green:g, blue:b, alpha:1)
//            }
//    
    
    
 
    @IBOutlet var celsiusLabel: UILabel!
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
   
    var celsiusValue: Double? {
        if let value = fahrenheitValue{
            return (value - 32)*(5/9)
        }else {
            return nil
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }else {
            fahrenheitValue = nil
        }
    
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue {
           celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }else {
            celsiusLabel.text = "???"
        }
        
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            
            let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
            let replacementTextHasDecimalSeparator = string.rangeOfString(".")
            
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                return false
            } else {
                return true
            }
    }
    
}