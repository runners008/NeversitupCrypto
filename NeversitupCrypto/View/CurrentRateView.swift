//
//  CurrentRateView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 16/7/2566 BE.
//

import SwiftUI

struct CurrentRateView: View {
    let model: CryptoViewModel
    let conversionModel: CryptoModel
    let selectedCurrency: Currency
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                Text("Current rate:")
                    .font(.system(.caption))
                    .padding()
                Spacer()
                Text(model.conversionRate(for: selectedCurrency, from: conversionModel, isCurrencyEnable: true))
                    .font(.system(size: 24, weight: .bold))
            }
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Text("last update \(model.formattedDate(date: conversionModel.time.updated, format: .dateTime))")
                        .font(.footnote)
                }
            }
        }
    }
}

struct CurrentRateView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentRateView(model: CryptoViewModel(), conversionModel: CryptoModel(time: Time(updated: "", updatedISO: ""), disclaimer: "", chartName: "", bpi: Bpi(usd: ConversionData(code: "", symbol: "", rate: "", description: "", rateFloat: 1.00), gbp: ConversionData(code: "", symbol: "", rate: "", description: "", rateFloat: 1.00), eur: ConversionData(code: "", symbol: "", rate: "", description: "", rateFloat: 1.00))), selectedCurrency: .usd)
    }
}
