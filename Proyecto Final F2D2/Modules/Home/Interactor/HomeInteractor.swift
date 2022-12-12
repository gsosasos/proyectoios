//
//  HomeInteractor.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import Foundation

protocol HomeInteractorProtocol {
    func products() -> [ProductResponse]
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol
    var api: RemoteRepository
    
    required init(presenter: HomePresenter, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    func products() -> [ProductResponse] {
        return api.fetchProducts()
    }
}
