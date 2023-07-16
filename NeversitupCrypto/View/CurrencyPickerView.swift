//
//  CurrencyPickerView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 16/7/2566 BE.
//

import SwiftUI

struct CurrencyPickerView: View {
    @State var selectedCurrency: Currency
    var didTap: (Currency) -> ()
    var body: some View {
        VStack {
            Picker("currency", selection: $selectedCurrency) {
                ForEach(Currency.allCases) { currency in
                    Text(currency.rawValue.uppercased())
                }
            }
            .onChange(of: selectedCurrency, perform: { currency in
                selectedCurrency = currency
                didTap(currency)
            })
            .pickerStyle(.segmented)
        }
    }
}

struct CurrencyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPickerView(selectedCurrency: .usd, didTap: { currency in
            print(currency)
        })
    }
}
