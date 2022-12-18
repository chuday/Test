//
//  PrDeyails.swift
//  Test
//
//  Created by Mikhail Chudaev on 12.12.2022.
//

import SwiftUI
import Foundation

struct PrDeyails: Hashable, Codable {
    let cpu, camera: String
    let capacity, color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd, ssd, title: String
    
    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
    }
}

class PDViewModel: ObservableObject {
    
    @Published var prDeyails: [PrDeyails] = []
    func fetchPD() {
        guard let url = URL(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, responce, error in
            guard let data = data, (responce != nil), error == nil else {
                return
            }
            
            do {
                let prDeyails = try JSONDecoder().decode(PrDeyails.self, from: data)
                DispatchQueue.main.async {
                    self?.prDeyails = [prDeyails]
                }
            }
            catch {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}

struct PrDeyailsView: View {
    
    @StateObject var viewModelPD = PDViewModel()
    
    var body: some View {
        
        List {
            ForEach(viewModelPD.prDeyails, id: \.self) {
                prDeyails in
                VStack {
                    Text(prDeyails.camera)
                    Text(prDeyails.cpu)
                    Text(prDeyails.sd)
                    Text(prDeyails.ssd)
                    Text(prDeyails.color.description)
                    Text(prDeyails.capacity.description)
                    ScrollView(.horizontal) {
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(viewModelPD.prDeyails, id: \.self) { image in
                                URLImage(urlString: prDeyails.images[0])
                                    .padding(.leading, 100)
                                URLImage(urlString: prDeyails.images[1])
                                
                            }
                        }
                    }
                    Text(prDeyails.isFavorites.description)
                    Text("\(prDeyails.price)")
                    Text("\(prDeyails.rating)")
                }
            }
        }
        .onAppear {
            viewModelPD.fetchPD()
            print(viewModelPD.prDeyails.description)
        }
    }
}

struct PrDeyailsView_Previews: PreviewProvider {
    static var previews: some View {
        PrDeyailsView()
    }
}
