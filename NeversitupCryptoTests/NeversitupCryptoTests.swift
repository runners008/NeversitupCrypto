//
//  NeversitupCryptoTests.swift
//  NeversitupCryptoTests
//
//  Created by Runn Siriphuwanich on 14/7/2566 BE.
//

import XCTest
@testable import NeversitupCrypto

final class NeversitupCryptoTests: XCTestCase {
    var subject: CryptoViewModel!
    var model: CryptoModel!
    
    override func setUp() {
        super.setUp()
        
        let conversion = CryptoModel(
            time: Time(updated: "", updatedISO: ""),
            disclaimer: "",
            chartName: "",
            bpi: Bpi(
                usd: ConversionData(code: "USD", symbol: "", rate: "30000", description: "", rateFloat: 30_000.0),
                gbp: ConversionData(code: "GBP", symbol: "", rate: "25000", description: "", rateFloat: 25_000.0),
                eur: ConversionData(code: "EUR", symbol: "", rate: "27000", description: "", rateFloat: 27_000.0)
            )
        )
        
        subject = CryptoViewModel()
        model = conversion

        subject?.conversionResponse = conversion
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
// MARK: - convertToBTC
    
    func testConvertToBTCByUsd() throws {
        let result = subject?.convertToBTC(from: .usd, amount: 3_000.0)
        XCTAssertEqual(result, 0.1)
    }
    
    func testConvertToBTCByGbp() throws {
        let result = subject?.convertToBTC(from: .gbp, amount: 50_000.0)
        XCTAssertEqual(result, 2.0)
    }
    
    func testConvertToBTCByEur() throws {
        let result = subject?.convertToBTC(from: .eur, amount: 2_700.0)
        XCTAssertEqual(result, 0.1)
    }
    
// MARK: - conversionRate
    
    func testConversionRateWithCurrencySign() throws {
        let result = subject?.conversionRate(for: .usd, from: model, isCurrencyEnable: true)
        XCTAssertEqual(result, "30000 USD")
    }
    
    func testConversionRateWithNoCurrencySign() throws {
        let result = subject?.conversionRate(for: .usd, from: model, isCurrencyEnable: false)
        XCTAssertEqual(result, "30000")
    }
    
// MARK: - getBTCValue
    
    func testGetBTCValue() throws {
        let bpi = model.bpi
        let result = subject.getBTCValue(value: bpi, currency: .usd)
        XCTAssertEqual(result, 30000.0)
    }

// MARK: - formattedDate
    
    func testShortFormattedDate() throws {
        let result = subject.formattedDate(date: "Jul 14, 2023 07:22:00 UTC", format: .time)
        XCTAssertEqual(result, "14:22")
    }
    
    func testLongFormattedDate() throws {
        let result = subject.formattedDate(date: "Jul 14, 2023 07:22:00 UTC", format: .dateTime)
        XCTAssertEqual(result, "14:22 14 Jul")
    }
}
