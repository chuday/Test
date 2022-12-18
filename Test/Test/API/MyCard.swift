//
//  MyCard.swift
//  Test
//
//  Created by Mikhail Chudaev on 12.12.2022.
//

import SwiftUI

struct MyCard: Hashable, Codable {
    let basket: [Basket]
    let delivery, id: String
    let total: Int
}

// MARK: - Basket
struct Basket: Hashable, Codable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}

class MCViewModel: ObservableObject {
    
    @Published var myCard: [MyCard] = []
    func fetchMC() {
        guard let url = URL(string: "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, responce, error in
            guard let data = data, (responce != nil), error == nil else {
                return
            }
            
            do {
                let myCard = try JSONDecoder().decode(MyCard.self, from: data)
                DispatchQueue.main.async {
                    self?.myCard = [myCard]
                }
            }
            catch {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}

struct MyCardView: View {
    
    @StateObject var viewModelMC = MCViewModel()
    
    var body: some View {
        
        List {
            ForEach(viewModelMC.myCard, id: \.self) { myCard in
                VStack {
                    Text(myCard.delivery)
                        .padding()
                    Text("\(myCard.total)")
                        .padding()
                    Text(myCard.basket.description)
                        .padding()
                                        
                    Text(myCard.basket.map { $0.images}.description )
                        .padding()
                    Text(myCard.basket.map { $0.price}.description )
                        .padding()
                    Text(myCard.basket.map { $0.title}.description )
                }
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModelMC.fetchMC()
                print(viewModelMC.myCard.description)
            }
    }
}

struct MyCardView_Previews: PreviewProvider {
    static var previews: some View {
        MyCardView()
    }
}
