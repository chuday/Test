//
//  SelectCategoriesCell.swift
//  Test
//
//  Created by Mikhail Chudaev on 10.12.2022.
//

import Foundation
import SwiftUI

struct SelectCategoriesCell: View {
    
    var categories: CategoriesResponse
    var content: String
    var image: String
    @State var isFaceUp = false
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawConstant.cornerRadius)
            if isFaceUp {
                shape
                    .fill()
                VStack {
                    Image(image)
                    
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                        .background(Color.orange)
                        .cornerRadius(50)
                        .padding(5)
                    
                    Text(content)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.orange)
                }
            } else {
                shape
                    .fill()
                
                VStack {
                    Image(image)
                    
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(50)
                        .padding(5)
                        .shadow(radius: 1)
                    
                    Text(content)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.black)
                }
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
    private struct DrawConstant {
        static let cornerRadius: CGFloat = 50
    }
    
}
