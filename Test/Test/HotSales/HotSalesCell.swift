//
//  HotSalesCell.swift
//  Test
//
//  Created by Mikhail Chudaev on 10.12.2022.
//

import Foundation
import SwiftUI

struct HotSalesCell: View {
    
    @StateObject var viewModel = ViewModelHotSales()
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 50)
            shape
                .fill()
                .foregroundColor(.green)
            HStack {
                VStack {
                    ZStack {
                        shape
                            .fill()
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                        
                        Text("New")
                    }
                    
                    ForEach(viewModel.homeStore, id: \.self) { homeStore in
                        
                        Text(homeStore.title)
                            .padding()
                        Text(homeStore.subtitle)
                            .padding()
                        Button {
                            print("main")
                        } label: {
                            Text("Buy now!")
                        }
                        .frame(width: 200, height: 40)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(.white)
                    }
                    .padding(.leading, 10)
                    Spacer()
                    Image("phones")
                        .padding()
                }
            }
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct HotSalesCell_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesCell()
    }
}
