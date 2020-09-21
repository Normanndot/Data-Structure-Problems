//
//  StockPrice.swift
//  DS-A
//
//  Created by Norman, ThankaVijay on 13/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation
// Enter your code here. Read input from STDIN. Print output to STDOUT

class StockMethod {
    static func readJSONFromFile<T: Decodable>(fileName: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            }
            catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    static func convertDate(datestr: String) -> Date  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d-MMMM-yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter.date(from: datestr)!
    }
    
    static func convertString(date: Date) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d-MMMM-yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter.string(from: date)
    }
}

struct Stock : Codable {
    let date : String
    let open : Double
    let high : Double
    let low : Double
    let close : Double
}

extension Stock: CustomStringConvertible {
    var description: String {
        return "\(date)   \(open)   \(close)\n"
    }
}

protocol StockProtocol {
    func openAndClosePrices(firstDate: Date, lastDate: Date, weekDay: String) -> String
}

class StockPrice: StockProtocol {
    
    private let stockData: [Stock]?
    
    init(stockData: [Stock]?) {
        self.stockData = stockData
    }
    
    func openAndClosePrices(firstDate: Date, lastDate: Date, weekDay: String) -> String {
        
        guard firstDate < lastDate else { return Error.InvalidParameterError.rawValue }
        guard let stocks = stockData else { return Error.InvalidParameterError.rawValue }
        
        let filteredStocks = stocks.lazy.filter { (aStock) -> Bool in
            
            let stockDate = StockMethod.convertDate(datestr: aStock.date)
            
            let fDateString = StockMethod.convertString(date: firstDate)
            let fDate = StockMethod.convertDate(datestr: fDateString)
            let lDateString = StockMethod.convertString(date: lastDate)
            let lDate = StockMethod.convertDate(datestr: lDateString)
            let stockDay = self.isDate(stockDate: stockDate)
            
            if stockDate <= lDate && stockDate >= fDate && stockDay == weekDay {
                return true
            }
            
            return false
        }.lazy.sorted { (a, b) -> Bool in
            let aDate = StockMethod.convertDate(datestr: a.date)
            let bDate = StockMethod.convertDate(datestr: b.date)
            return aDate < bDate
        }.lazy.map{("\($0.date)   \($0.open)   \($0.close)")}.joined(separator: "\n")

        return filteredStocks
    }
    
    private func isDate(stockDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter.string(from: stockDate)
        
    }
}

enum Error : String {
    case NoStockError = "Stock not found."
    case InvalidParameterError = "Invalid parameter."
}

let data = StockMethod.readJSONFromFile(fileName: "data", type: [Stock].self)
let stock = StockPrice(stockData: data)

let output = stock.openAndClosePrices(firstDate: Date(timeIntervalSinceReferenceDate: -31560535), lastDate: Date(timeIntervalSinceReferenceDate: -27067735), weekDay: "Monday")
