//
//  BestSellerCell.swift
//  Test
//
//  Created by Mikhail Chudaev on 10.12.2022.
//

import Foundation
import SwiftUI

struct BestSellerCell: View {
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
                        Label("", systemImage: "heart.fill")
                    }
                    
                    Image("phones")
                        .frame(width: 200, height: 200)
                        .background(.purple)
                        .padding()
                    Text("$1,047")
                        .padding()
                    Text("Samsung Galaxy s20 Ultra")

                }
                .padding(.leading, 10)
            }
        }
    }
}

struct BestSellerCell_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerCell()
    }
}
