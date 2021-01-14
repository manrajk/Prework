//
//  ViewController.swift
//  Prework
//
//  Created by Manraj Kumar on 1/8/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipCostLabel: UILabel!
    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = Theme.background
        billAmount.text = currencyFormatting() + "0"
        tipCostLabel.text = currencyFormatting() + "0"
        totalLabel.text = currencyFormatting() + "0"
        
    }
    @IBAction func onTap(_ sender: Any) {

    }
    
    // Built in function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Inital value
    var initBill = "0"
    
    
    @IBAction func delButton(_ sender: UIButton) {
        if initBill.count == 1{
            initBill = "0"
        }
        else{
            let initBillNew = initBill.prefix(initBill.count - 1)
            initBill = String(initBillNew)
        }
        billAmount.text = currencyFormatting() + initBill
        calcTips()
        
    
    }
    @IBAction func decButton(_ sender: UIButton) {
        if !initBill.contains("."){
            initBill.append(".")
            billAmount.text = currencyFormatting() + initBill
        }
    }
    
    
    @IBAction func zeroButton(_ sender: UIButton) {
        // If amount is already 0 do nothing else...
        if Double(initBill) != Double("0"){
            changeBill(inp: "0")
        }
    }
    @IBAction func oneButton(_ sender: UIButton) {
        changeBill(inp: "1")
    }
    @IBAction func twoButton(_ sender: UIButton) {
        changeBill(inp: "2")
    }
    @IBAction func threeButton(_ sender: UIButton) {
        changeBill(inp: "3")
    }
    @IBAction func fourButton(_ sender: UIButton) {
        changeBill(inp: "4")
    }
    @IBAction func fiveButton(_ sender: UIButton) {
        changeBill(inp: "5")
    }
    @IBAction func sixButton(_ sender: UIButton) {
        changeBill(inp: "6")
    }
    @IBAction func sevenButton(_ sender: UIButton) {
        changeBill(inp: "7")
    }
    @IBAction func eightButton(_ sender: UIButton) {
        changeBill(inp: "8")
    }
    @IBAction func nineButton(_ sender: UIButton) {
        changeBill(inp: "9")
    }
    
    
    
    @IBAction func changerSlider(_ sender: UISegmentedControl) {
        calcTips()
    }
    
    
    func changeBill(inp: String){
        if initBill.contains("."){
            initBill.append(inp)
            let initBillFloat = (Float(initBill)! * 100)
            let initBillInt = Double(Int(initBillFloat)) / 100
            initBill = String(initBillInt)
            billAmount.text = currencyFormatting() + initBill
        }
        else{
            
            if Double(initBill) != Double("0"){
                initBill.append(inp)
                billAmount.text = currencyFormatting() + initBill
            }
            else{
                initBill = inp
                billAmount.text = currencyFormatting() + initBill
            }
            
        }
        calcTips()
        
    }
    
    
    func calcTips(){
        let tipPercentages = [0.15, 0.18, 0.2]
        let newBill = Double(initBill)!
        
        var tip = newBill * tipPercentages[tipControl.selectedSegmentIndex] * 100
        tip.round()
        let IntTip = Int(tip)
        let finalTip = Double(IntTip) / 100
        
        let total = newBill + finalTip
        
       
        tipCostLabel.text = formator(num: finalTip)
        totalLabel.text = formator(num: total)
        
        
    }
    
    
    func currencyFormatting() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return String((currencyFormatter.string(from: NSNumber.init(value: 0))!).prefix(1))
        
    }
    
    
    func formator(num: Double) -> String{
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        let formattedTipAmount = formatter.string(from: num as NSNumber)
        return formattedTipAmount!
        
        
    }
    


    

}
