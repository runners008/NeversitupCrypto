//
//  HistoryPickerView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 16/7/2566 BE.
//

import SwiftUI

struct HistoryPickerView: View {
    @State var selectedHistoricView: HistoryDisplayOption
    var didTap: ((HistoryDisplayOption) -> ())
    var body: some View {
        VStack {
            Picker("History", selection: $selectedHistoricView) {
                ForEach(HistoryDisplayOption.allCases) { view in
                    Text(view.rawValue)
                }
            }
            .onChange(of: selectedHistoricView, perform: { view in
                selectedHistoricView = view
                didTap(view)
            })
            .pickerStyle(.segmented)
        }
    }
}

struct HistoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPickerView(selectedHistoricView: .lineChart, didTap: { view in
            print(view.rawValue)
        })
    }
}
