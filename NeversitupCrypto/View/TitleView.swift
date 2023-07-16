//
//  TitleView.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 16/7/2566 BE.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("BTC Converter")
                .font(.system(.largeTitle))
                .padding()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
