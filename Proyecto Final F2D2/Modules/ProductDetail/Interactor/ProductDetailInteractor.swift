//
//  Interactor.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol ProductDetailInteractorProcotol: AnyObject {
    
}

class ProductDetailInteractor: ProductDetailInteractorProcotol {
    
    weak var presenter: ProductDetailPresenterProcotol?
    var api: RemoteRepository
    
    required init(presenter: ProductDetailPresenter, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}
