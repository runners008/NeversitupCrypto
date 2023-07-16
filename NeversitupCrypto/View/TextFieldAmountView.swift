//
//  TextFieldAmountView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 16/7/2566 BE.
//

import SwiftUI

struct TextFieldAmountView: View {
    @Binding var inputAmount: Float
    let formatter: NumberFormatter
    let selectedCurrency: Currency
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("Enter amount:")
                .font(.system(.caption))
                .padding()
            Spacer()
            TextField("0.00", value: $inputAmount, formatter: formatter)
                .multilineTextAlignment(.trailing)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text(selectedCurrency.rawValue.uppercased())
                .font(.system(.caption))
        }
    }
}

struct TextFieldAmountView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldAmountView(inputAmount: Binding.constant(20.0), formatter: NumberFormatter(), selectedCurrency: .usd)
    }
}
