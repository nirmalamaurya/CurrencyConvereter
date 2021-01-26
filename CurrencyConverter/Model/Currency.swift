//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Nirmala on 12/1/21.
//

enum CurrencyTypes: String, CaseIterable{
    
    case  USD = "USD"
    case  CAD = "CAD"
    case  EUR = "EUR"
    case  GBP = "GBP"
    case  JPY = "JPY"
    
     static func getCurriencies ()->( [CurrencyTypes]){
        var curriencies = [CurrencyTypes]()
        for currency in CurrencyTypes.allCases{
            curriencies.append(currency)
        }
        return curriencies
    }
}
struct Currency:Codable {
    
    let USD : Double
    let CAD : Double
    let GBP : Double
    let JPY : Double
    let EUR : Double

}

struct CurrencyData:Codable {
    let rates:Currency
}


