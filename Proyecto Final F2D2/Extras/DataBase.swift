//
//  DataBase.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 13/12/22.
//

import Foundation

protocol DataBase {
    func getData(key: String) -> Any?
    func saveData(_ data: Any, key: String)
    func updateData(_ value: String)
    func deleteData(_ value: String)
}

class UserDefaultDataBase: DataBase {
    
    let defaults = UserDefaults.standard
    
    func getData(key: String) -> Any? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    func saveData(_ data: Any, key: String) {
        defaults.set(data, forKey: key)
    }
    
    func updateData(_ value: String) {
        
    }
    
    func deleteData(_ value: String) {
        
    }
}
