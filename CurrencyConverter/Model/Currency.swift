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

    
}
struct Currency:Codable {
    
    let USD : Double
    let CAD : Double
    let GBP : Double
    let JPY : Double
    let EUR : Double

}

struct FetchedData:Codable {
    let rates:Currency
}


