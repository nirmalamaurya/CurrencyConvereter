    //
    //  RatesFetcher.swift
    //  CurrencyConverter
    //
    //  Created by Nirmala on 13/1/21.
    //

    import Foundation


    class RatesFetcher{
        
        static  let fetch = RatesFetcher()
           
           private init(){}
        
       lazy var urlSymbols:String = {
        var curriencies = CurrencyTypes.getCurriencies()
        return curriencies.map{ $0.rawValue }.joined(separator: ",")
        }()
        
            
    func CurrencyConveter(handler:@escaping(Currency)->()){
            
        let dataURL = URL(string: baseURL +  "?access_key=\(APIKey)&symbols=\(urlSymbols)")!
        let session = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
            
            if let error = error{
                print("Error is", error)
            }
            
            if let data = data{
            
            do {
                let decoder = JSONDecoder()
                let currencyData = try decoder.decode(CurrencyData.self, from: data)
                handler(currencyData.rates)
            } catch {
                print("An Error occured during decoding JSON Data")
            }
        }
        }
        session.resume()
        
      }
    }

