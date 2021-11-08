//
//  ViewController.swift
//  438SLabOne
//
//  Created by Julia Grandury on 9/9/19.
//  Copyright © 2019 Julia Grandury. All rights reserved.
//

//Feature added: Difference between OG Price and Final Price to show
//how much was saved! Or calculation in another currency?

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorField: UILabel!
    @IBOutlet weak var errorField2: UILabel!
    @IBOutlet weak var budgetField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var discountField: UITextField!
    @IBOutlet weak var taxField: UITextField!
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var remainingField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //    INITIALIZING THE VARIABLES IN THE 4 BOXES
    var budget : Double? = 0
    var price : Double? = 0
    var discount : Double? = 0
    var tax : Double? = 0
    var totalN = Double(0)
    var remaining = Double(0)
    
    
    @IBAction func budgetInput(_ sender: Any) {
        budget = Double(budgetField.text!)
        if budget == nil{
            budget = 0
            errorField.text = "Error. Please enter a nonnegative"
            errorField2.text = "integer for all entries below."
        }
        else{
            errorField.text = ""
            errorField2.text = ""
        }
        calculateTotal(price: price!, discount: discount!, tax: tax!)
        calculateRemaining(budget: budget!, totalN: totalN)
    }
    
    @IBAction func priceInput(_ sender: Any) {
        price = Double(priceField.text!)
        if price == nil {
            price = 0
            errorField.text = "Error. Please enter a nonnegative"
            errorField2.text = "integer for all entries below."
        }
        else{
            errorField.text = ""
            errorField2.text = ""
        }
        calculateTotal(price: price!, discount: discount!, tax: tax!)
        calculateRemaining(budget: budget!, totalN: totalN)
    }
    @IBAction func discountInput(_ sender: Any) {
        discount = Double(discountField.text!)
        if discount == nil {
            discount = 0
            errorField.text = "Error. Please enter a nonnegative"
            errorField2.text = "integer for all entries below."
        }
        else{
            errorField.text = ""
            errorField2.text = ""
        }
        calculateTotal(price: price!, discount: discount!, tax: tax!)
        calculateRemaining(budget: budget!, totalN: totalN)
    }
    @IBAction func taxInput(_ sender: Any) {
        tax = Double(taxField.text!)
        if tax == nil {
            tax = 0
            errorField.text = "Error. Please enter a nonnegative"
            errorField2.text = "integer for all entries below."
        }
        else{
            errorField.text = ""
            errorField2.text = ""
        }
        calculateTotal(price: price!, discount: discount!, tax: tax!)
        calculateRemaining(budget: budget!, totalN: totalN)
    }
    @IBAction func priceOutput(_ sender: Any) {
        totalField.text = "$\(String(format:"%.2f",totalN))"
        calculateRemaining(budget: budget!, totalN: totalN)
    }

    
//      FUNCTION THAT CALCULATES THE TOTAL PRICE
        func calculateTotal(price:Double, discount:Double, tax:Double){
            if price<0 || tax<0 || discount<0{
                errorField.text = "Error. Please enter a nonnegative"
                errorField2.text = "integer for all entries below."
            }
            else {
                if price==0{
                    totalN = 0
                }
                else {
                    if discount>0 && tax>0{
                        let discountR = 1-discount/100
                        let taxT = price*tax/100
                        totalN = price*discountR+taxT
                    }
                    else{
                        if discount>0 && tax==0{
                            let discountR = 1-discount/100
                            totalN = price*discountR
                        }
                        else{
                            let taxT = price*tax/100
                            totalN = price+taxT
                        }
                    }
                }
            }
            totalField.text = "$\(String(format:"%.2f",totalN))"
        }
    
    func calculateRemaining(budget:Double, totalN:Double){
        remaining = budget-totalN
        remainingField.text = "$\(String(format:"%.2f",remaining))"
    }
    
}

