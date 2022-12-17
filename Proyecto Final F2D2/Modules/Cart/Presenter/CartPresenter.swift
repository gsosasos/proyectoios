//
//  CartPresenter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol CartPresenterProtocol: AnyObject {
    func presentGoToConfirmation()
}

class CartPresenter: CartPresenterProtocol {
    
    weak var view: CartViewProtocol?
    var router: CartRouterProtocol?
    weak var interactor: CartInteractorProtocol?
    
    func presentGoToConfirmation() {
        router?.navToConfirmation()
    }
    
}
