//
//  TabbarCell.swift
//  Test
//
//  Created by Mikhail Chudaev on 10.12.2022.
//

import Foundation
import SwiftUI

struct TabbarCell: View {
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 50)
            shape
                .fill()
                .foregroundColor(.blue)
            HStack {
                Text("Explorer")
                Image(systemName: "circle.fill")
                Image(systemName: "circle.fill")
                Image(systemName: "circle.fill")
            }
        }
    }
}

struct TabbarCell_Previews: PreviewProvider {
    static var previews: some View {
        TabbarCell()
    }
}
