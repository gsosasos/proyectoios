//
//  HomePresenter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol HomePresenterProtocol {
    func getProducts() -> [ProductResponse]
    func presentItemDetail()
}

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
    func getProducts() -> [ProductResponse] {
        return interactor?.products() ?? []
    }
    
    func presentItemDetail() {
        router?.navItemDetail()
    }
}
