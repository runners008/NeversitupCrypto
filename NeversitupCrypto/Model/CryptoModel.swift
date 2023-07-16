//
//  CryptoModel.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 14/7/2566 BE.
//

import Foundation

struct CryptoModel: Codable {
    let time: Time
    let disclaimer: String
    let chartName: String
    let bpi: Bpi
}

struct Time: Codable {
    let updated: String
    let updatedISO: String
}

struct Bpi: Codable {
    let usd, gbp, eur: ConversionData

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case gbp = "GBP"
        case eur = "EUR"
    }
}

struct ConversionData: Codable, Comparable {
    static func < (lhs: ConversionData, rhs: ConversionData) -> Bool {
        return lhs.rateFloat < rhs.rateFloat
    }
    
    let code: String
    let symbol: String
    let rate: String
    let description: String
    let rateFloat: Float

    enum CodingKeys: String, CodingKey {
        case code, symbol, rate, description
        case rateFloat = "rate_float"
    }
}

enum Currency: String, CaseIterable, Identifiable {
    case usd
    case gbp
    case eur
    
    var id: Self { self }
}

enum HistoryDisplayOption: String, CaseIterable, Identifiable {
    case lineChart = "Chart"
    case listView = "List"
    
    var id: Self { self }
}

enum AppDateFormat: String {
    case time = "HH:mm"
    case dateTime = "HH:mm dd MMM"
}
