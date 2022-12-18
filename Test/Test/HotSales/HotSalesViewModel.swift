//
//  HotSalesViewModel.swift
//  Test
//
//  Created by Mikhail Chudaev on 14.12.2022.
//

import Foundation
import SwiftUI

class ViewModelHotSales: ObservableObject {
    
    @Published var homeStore: [HomeStore] = []
    func fetch() {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, responce, error in
            guard let data = data, (responce != nil), error == nil else {
                return
            }
            
            do {
                let courses = try JSONDecoder().decode(HomeStores.self, from: data)
                DispatchQueue.main.async {
                    self?.homeStore = courses.homeStore
                }
            }
            catch {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}
