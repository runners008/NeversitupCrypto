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

struct ConversionData: Codable {
    let code: String
    let symbol: String
    let rate: String
    let description: String
    let rateFloat: Double

    enum CodingKeys: String, CodingKey {
        case code, symbol, rate, description
        case rateFloat = "rate_float"
    }
}
