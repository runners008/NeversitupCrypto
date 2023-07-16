//
//  HistoryLineChartView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 16/7/2566 BE.
//

import SwiftUI
import Charts

struct HistoryLineChartView: View {
    let model: CryptoViewModel
    let selectedCurrency: Currency
    var body: some View {
        Chart {
            ForEach(model.conversionHistory, id: \.time.updated) { item in
                LineMark(
                    x: .value("Time", model.formattedDate(date: item.time.updated, format: .time)),
                    y: .value("Val", model.getBTCValue(value: item.bpi, currency: selectedCurrency))
                ).interpolationMethod(.catmullRom)
            }
        }
        .chartYScale(
            domain:
                (model.getBTCValue(value: model.conversionHistory[0].bpi, currency: selectedCurrency) - 200)...(model.getBTCValue(value: model.conversionHistory[0].bpi, currency: selectedCurrency) + 200)
        )
    }
}

struct HistoryLineChartView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryLineChartView(
            model: CryptoViewModel(), selectedCurrency: .usd)
    }
}
