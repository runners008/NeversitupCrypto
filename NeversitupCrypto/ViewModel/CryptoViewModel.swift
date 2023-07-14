//
//  CryptoViewModel.swift
//  NeversitupCrypto
//
//  Created by Runn Siriphuwanich on 14/7/2566 BE.
//

import Foundation

class CryptoViewModel: ObservableObject {
    @Published var conversionResponse: CryptoModel?
    private let urlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
    
    init() {
        fetchApi()
    }
    
    func fetchApi() {
        let session = URLSession.shared
        let url = URL(string: urlString)!
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil { return }
            if let cryptoData = data {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(CryptoModel.self, from: cryptoData)
                    DispatchQueue.main.async {
                        self.conversionResponse = decodedData
                    }
                } catch {
                    return
                }
            }
        }
        task.resume()
    }
    
}
