//
//  Networking.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import Foundation

protocol RemoteRepository {
    func fetchProducts() -> [ProductResponse]
}

class MarketAPI: RemoteRepository {
    func fetchProducts() -> [ProductResponse] {
        return []
    }
    
    
}

class MarketMOCK: RemoteRepository {
    func fetchProducts() -> [ProductResponse] {
        
        let resource = "list_products"
        
        if let url = Bundle.main.url(forResource: resource, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                
                // API real
                let decoder = JSONDecoder()
                let result = try decoder.decode([ProductResponse].self, from: data)
                return result
            } catch let error {
                //print(error.localizedDescription)
            }
            
        } else {
            fatalError("No se ha encontrado el archivo")
        }
        
        return []
    }
    
    
}
