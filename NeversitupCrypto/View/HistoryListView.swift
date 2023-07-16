//
//  HistoryListView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 14/7/2566 BE.
//

import SwiftUI

struct HistoryListView: View {
    let model: CryptoViewModel
    let currency: Currency
    
    var body: some View {
        VStack(spacing: 8.0) {
            Text("Conversion History")
                .font(.system(.headline))
                .padding()
            List(model.conversionHistory, id: \.time.updated) { data in
                HStack {
                    Text(model.formattedDate(date: data.time.updated))
                    Spacer()
                    Text(model.conversionRate(for: currency, from: data, isCurrencyEnable: false))
                }
            }
        }.background()
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView(model: CryptoViewModel(), currency: .usd)
    }
}
