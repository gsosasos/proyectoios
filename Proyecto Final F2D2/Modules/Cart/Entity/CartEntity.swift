//
//  Item.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

struct CartEntity: Codable {
    let total: Double
    var products: [CartProductEntity]
   
}

struct CartProductEntity: Codable {
    let id: Int
    let name: String
    let image: String
    let price : Double
    var quantity: Int
}
