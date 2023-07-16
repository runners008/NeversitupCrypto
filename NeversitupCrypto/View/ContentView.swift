//
//  ContentView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 14/7/2566 BE.
//

import SwiftUI
import Charts
struct ContentView: View {
    
    @ObservedObject var model = CryptoViewModel()
    @State private var inputAmount: Float = 0.00
    @State private var selectedCurrency: Currency = .usd
    @State private var selectedHistoricView: HistoryDisplayOption = .lineChart
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        if let conversionModel = model.conversionResponse {
            VStack(alignment: .leading, spacing: 8.0) {
                
                TitleView()
                
                CurrencyPickerView(selectedCurrency: selectedCurrency) { currency in
                    selectedCurrency = currency
                }
                
                CurrentRateView(model: model, conversionModel: conversionModel, selectedCurrency: selectedCurrency)
                
                TextFieldAmountView(inputAmount: $inputAmount, formatter: formatter, selectedCurrency: selectedCurrency)
                
                ConvertAmountView(model: model, selectedCurrency: selectedCurrency, amount: inputAmount)
                
                HistoryPickerView(selectedHistoricView: selectedHistoricView) { view in
                    selectedHistoricView = view
                }
                
                if selectedHistoricView == .lineChart {
                    HistoryLineChartView(model: model, selectedCurrency: selectedCurrency)
                } else {
                    HistoryListView(model: model, currency: selectedCurrency)
                }
                
            }
            .padding()
        } else {
            ProgressView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
