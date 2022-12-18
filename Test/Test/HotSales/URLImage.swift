//
//  URLImage.swift
//  Test
//
//  Created by Mikhail Chudaev on 14.12.2022.
//

import Foundation
import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 230, height: 170)
                .background(Color.gray)
            
        } else {
            Image(systemName: "video")
                .resizable()
                .frame(width: 230, height: 170)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
            
        }
        task.resume()
    }
}
