//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Nirmala on 13/1/21.
//

import UIKit

class ViewController: UIViewController {

    var currency:Currency!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            
            RatesFetcher.fetch.CurrencyConveter { [unowned self](rates) in
                self.currency = rates
                
                print("current rates for USA is", rates.USD)
                
            }
            
        }
       }
    }

    
