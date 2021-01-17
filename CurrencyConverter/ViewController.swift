//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Nirmala on 13/1/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var convertedAmount: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!


    @IBOutlet weak var dottedView: UIView!

    var currency:Currency!
    lazy var curriencies = CurrencyTypes.getCurriencies()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        dottedView.createDottedLine(width: 3, color: UIColor.black.cgColor)
        
        DispatchQueue.global().async {
           RatesFetcher .fetch.CurrencyConveter { [unowned self](rates) in
                self.currency = rates
            
                DispatchQueue.main.async {
                    let convetedAmount =   ConvertFromAUD(to: CurrencyTypes.USD)
                    self.convertedAmount.text = String(format:"%.2f", convetedAmount)

                }
            }
          }
       }
    

func selectCurrency()->CurrencyTypes.RawValue{
  
    let selected = CurrencyTypes.USD
    return selected.rawValue
    
}

func ConvertFromAUD(to selectedCurrencyType:CurrencyTypes )->Double{
    
    var multiplier  = 0.0

    guard let amount = Double ((amountField.text!).replacingOccurrences(of: "$", with: "")) else {
        
        return multiplier
    }
    
    switch selectedCurrencyType {
    case .CAD:
        multiplier = currency.CAD
    case .USD:
        multiplier = currency.USD
    case .EUR:
        multiplier = currency.EUR
    case .GBP:
        multiplier = currency.GBP
    case .JPY:
        multiplier = currency.JPY
}
    return (amount * multiplier)
    
}
}
extension ViewController:UITextFieldDelegate{
    
    
    
}
extension ViewController: UIPickerViewDataSource{
func numberOfComponents(in pickerView: UIPickerView) -> Int {
   return 1
}
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
   return curriencies.count
}
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let modeView = UIView()
    modeView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    let modeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    modeLabel.textColor = .yellow
    modeLabel.text = curriencies[row]
    modeLabel.textAlignment = .center
    modeView.addSubview(modeLabel)
    return modeView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return 94
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    let selectedValue = curriencies[row]
        
        print("selected Value",selectedValue)
    }
}


