//
//  RatesFetcher.swift
//  CurrencyConverter
//
//  Created by Nirmala on 13/1/21.
//

import Foundation

class RatesFetcher{
    
    let APIKey = "6266d2a41a5950256313b48515b22ed2"
    
    var urlSymbols:String = {
        var curriencies = [String]()
        for currency in CurrencyTypes.allCases{
            curriencies.append(currency.rawValue)
        }
        return curriencies.joined(separator: ",")
    }()
    
 static  let fetch = RatesFetcher()
    
    private init(){}
        
    func CurrencyConveter(handler:@escaping(Currency)->()){
    let dataURL = URL(string:  "http://data.fixer.io/api/latest?access_key=\(APIKey)&symbols=\(urlSymbols)")!
    let session = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
        
        if let error = error{
            print("Error is", error)
        }
        
        if let data = data{
        
        do {
            let decoder = JSONDecoder()
            let currencyData = try decoder.decode(FetchedData.self, from: data)
            handler(currencyData.rates)
        } catch {
            print("An Error occured during decoding JSON Data")
        }
    }
    }
    session.resume()
    
  }
}

