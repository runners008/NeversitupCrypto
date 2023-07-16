//
//  ConvertAmountView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 16/7/2566 BE.
//

import SwiftUI

struct ConvertAmountView: View {
    let model: CryptoViewModel
    let selectedCurrency: Currency
    let amount: Float
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("BTC Amount:")
                .font(.system(.caption))
                .padding()
            Spacer()
            Text("\(model.convertToBTC(from: selectedCurrency, amount: amount)) BTC")
                .font(.system(size: 24, weight: .bold))
        }
    }
}

struct ConvertAmountView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertAmountView(model: CryptoViewModel(), selectedCurrency: .usd, amount: 1.00)
    }
}
