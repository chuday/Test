//
//  HomeStoreModel.swift
//  Test
//
//  Created by Mikhail Chudaev on 14.12.2022.
//

import Foundation

struct HomeStores: Hashable, Codable {
    
    let homeStore: [HomeStore]

    enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
    }
}

struct HomeStore: Hashable, Codable {
    let id: Int
    let isNew: Bool?
    let title, subtitle: String
    let picture: String
    let isBuy: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title, subtitle, picture
        case isBuy = "is_buy"
    }
}
