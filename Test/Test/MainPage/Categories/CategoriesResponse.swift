//
//  CategoriesResponse.swift
//  Test
//
//  Created by Mikhail Chudaev on 13.12.2022.
//

import Foundation
import UIKit
import SwiftUI

struct CategoriesResponse: Hashable, Codable, Identifiable {
    
    var id: Int
    var title: String
    var image: String
}
