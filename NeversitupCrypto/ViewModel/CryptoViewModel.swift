//
//  CryptoViewModel.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 14/7/2566 BE.
//

import Foundation
protocol CryptoBusinessLogic {
    func convertToBTC(from currenncy: Currency, amount: Float) -> Float
    func conversionRate(for currency: Currency, from model: CryptoModel, isCurrencyEnable: Bool) -> String
    func getBTCValue(value: Bpi, currency: Currency) -> Float
    func formattedDate(date: String, format: AppDateFormat) -> String
}

class CryptoViewModel: ObservableObject, CryptoBusinessLogic {
    
    @Published var conversionResponse: CryptoModel?
    @Published var conversionHistory: [CryptoModel] = []
    
    private weak var timer: Timer?
    private let urlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
    
    init() {
        startTimer()
    }
    
    deinit {
        stopTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
                    self?.fetchApi()
                }
        timer?.fire()
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func fetchApi() {
        let session = URLSession.shared
        let url = URL(string: urlString)!
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if error != nil { return }
            if let cryptoData = data {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(CryptoModel.self, from: cryptoData)
                    DispatchQueue.main.async{ [weak self] in
                        self?.conversionResponse = decodedData
                        self?.conversionHistory.append(decodedData)
                    }
                } catch {
                    return
                }
            }
        }
        task.resume()
    }
    
    func convertToBTC(from currenncy: Currency, amount: Float) -> Float {
        var value: Float?
        switch currenncy {
        case .usd:
            value = Float(amount / (conversionResponse?.bpi.usd.rateFloat ?? 1.0))
        case .gbp:
            value = Float(amount / (conversionResponse?.bpi.gbp.rateFloat ?? 1.0))
        case .eur:
            value = Float(amount / (conversionResponse?.bpi.eur.rateFloat ?? 1.0))
        }
        return value ?? 0.00
    }
    
    func conversionRate(for currency: Currency, from model: CryptoModel, isCurrencyEnable: Bool) -> String {
        let rate: String
        
        switch currency {
        case .usd:
            rate = isCurrencyEnable ? "\(model.bpi.usd.rate) USD" : model.bpi.usd.rate
        case .gbp:
            rate = isCurrencyEnable ? "\(model.bpi.gbp.rate) GBP" : model.bpi.gbp.rate
        case .eur:
            rate = isCurrencyEnable ? "\(model.bpi.eur.rate) EUR" : model.bpi.eur.rate
        }
        
        return rate
    }
    
    func getBTCValue(value: Bpi, currency: Currency) -> Float {
        switch currency {
        case .usd:
            return value.usd.rateFloat
        case .gbp:
            return value.gbp.rateFloat
        case .eur:
            return value.eur.rateFloat
        }
    }
    
    func formattedDate(date: String, format: AppDateFormat) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm:ss zzz"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        if let utcDate = dateFormatter.date(from: date) {
            let utcPlus7TimeZone = TimeZone(secondsFromGMT: 7 * 60 * 60)!
            dateFormatter.timeZone = utcPlus7TimeZone
            dateFormatter.dateFormat = format.rawValue
            let convertedDate = dateFormatter.string(from: utcDate)
            return convertedDate
        } else {
            print("Invalid date format")
        }
        return ""
    }
    
}
