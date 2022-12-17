//
//  Product.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 11/12/22.
//

import Foundation

struct ProductResponse: Decodable {
    let id: Int
    let name: String
    let image: String
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case price
    }
}
