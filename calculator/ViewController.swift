import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var currentNumber: Int = 0
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operation = ""
    var stillTyping = true
    
    
    @IBAction func equal(_ sender: UIButton) {
        if stillTyping {
            secondOperand = Double(resultLabel!.text!)!
        }
        var result: Double = 0
        
        switch operation {
        case "11":
            result = secondOperand + firstOperand
            if result.truncatingRemainder(dividingBy: 1) == 0.0 {
                resultLabel.text = "\(Int(result))"
            } else {resultLabel.text = "\(result)"}
        case "12":
            result = firstOperand - secondOperand
            if result.truncatingRemainder(dividingBy: 1) == 0.0 {
                resultLabel.text = "\(Int(result))"
            } else {resultLabel.text = "\(result)"}
        case "14":
            if secondOperand != 0.0 {
                result = firstOperand / secondOperand
            }
            
            if result.truncatingRemainder(dividingBy: 1) == 0.0 {
                resultLabel.text = "\(Int(result))"
            } else {resultLabel.text = "\(result)"}
        case "13":
            result = firstOperand * secondOperand
            if result.truncatingRemainder(dividingBy: 1) == 0.0 {
                resultLabel.text = "\(Int(result))"
            } else {resultLabel.text = "\(result)"}
        default:
            break
        }
        stillTyping = false
    }
    
    @IBAction func digits(_ sender: UIButton) {
        
        currentNumber = sender.tag - 1
        
        if stillTyping == true && resultLabel.text! == "0" {
            resultLabel.text! = "\(currentNumber)"
        } else if stillTyping == true && resultLabel.text! == "0." {
            resultLabel.text = resultLabel.text! + String(currentNumber)
        } else if stillTyping == true && resultLabel.text! != "0" {
            resultLabel.text = resultLabel.text! + String(currentNumber)
        } else {
            resultLabel.text = "\(currentNumber)"
            stillTyping = true
        }
        
    }
    
    @IBAction func twoOperandSign(_ sender: UIButton) {
        firstOperand = Double(resultLabel.text!)!
        stillTyping = false
        operation = String(sender.tag)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        resultLabel.text = "0"
        secondOperand = 0
        firstOperand = 0
        operation = ""
        stillTyping = false
    }
    
    
    @IBAction func decimal(_ sender: Any) {
        
        let number = resultLabel.text!
        let point = "."
        
        if !number.contains(point) {
            resultLabel.text = resultLabel.text! + "."
        }
    }
    
    
    @IBOutlet weak var resultLabel: UILabel!
}

