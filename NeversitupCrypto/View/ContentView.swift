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
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        if let conversionModel = model.conversionResponse {
            VStack(alignment: .leading, spacing: 8.0) {
                
                VStack(alignment: .center) {
                    Text("BTC Converter")
                        .font(.system(.largeTitle))
                    .padding()
                }
                
                VStack {
                    Picker("currency", selection: $selectedCurrency) {
                        ForEach(Currency.allCases) { currency in
                            Text(currency.rawValue.uppercased())
                        }
                    }
                    .onChange(of: selectedCurrency, perform: { currency in
                        selectedCurrency = currency
                    })
                    .pickerStyle(.segmented)
                }
                
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
                            Text("last update \(model.formattedDate(date: conversionModel.time.updated))")
                                .font(.footnote)
                        }
                    }
                }
                
                HStack(alignment: .lastTextBaseline) {
                    Text("Enter amount:")
                        .font(.system(.caption))
                        .padding()
                    Spacer()
                    TextField("0.00", value: $inputAmount, formatter: formatter)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack(alignment: .lastTextBaseline) {
                    Text("BTC Amount:")
                        .font(.system(.caption))
                        .padding()
                    Spacer()
                    Text("\(model.convertToBTC(from: selectedCurrency, amount: inputAmount)) BTC")
                        .font(.system(size: 24, weight: .bold))
                }
                Chart {
                    ForEach(model.conversionHistory, id: \.time.updated) { item in
                        LineMark(
                            x: .value("Time", item.time.updated),
                            y: .value("Val", item.bpi.usd.rateFloat)
                        )
                    }
                }
                
//                HistoryListView(model: model, currency: selectedCurrency)
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

