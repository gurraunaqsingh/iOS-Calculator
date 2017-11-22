//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Raunaq on 11/22/17.
//  Copyright © 2017 Raunaq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberONScreen:Double = 0;
    var previousNumber:Double = 0;
    var operation = 0;
    var performingMath = false;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton){
        
        if performingMath == true{
            label.text = String(sender.tag-1)
            numberONScreen = Double(label.text!)!
            performingMath = false
        }else{
            label.text = label.text!  + String(sender.tag-1)
            numberONScreen = Double(label.text!)!
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12{ //Divide
                label.text = "/";
                
            }else if sender.tag == 13{ //Multiply
                label.text = "x";
                
            }else if sender.tag == 14{ //Subtract
                label.text = "-";
                
            }else if sender.tag == 15{ //Add
                label.text = "+";
                
            }
            
            operation = sender.tag
            performingMath = true;
            
        }else if sender.tag == 16{
            if operation == 12{ //Divide
                label.text = String(previousNumber / numberONScreen)
                
            }else if operation == 13{ //Multiply
                label.text = String(previousNumber * numberONScreen)
                
            }else if operation == 14{ //Subtract
                label.text = String(previousNumber - numberONScreen)
                
            }else if operation == 15{ //Add
                label.text = String(previousNumber + numberONScreen)
            }
        }else if sender.tag == 11{
            label.text = ""
            previousNumber = 0;
            numberONScreen = 0
            operation = 0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

