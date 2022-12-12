//
//  ItemDetailPresenter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol ItemDetailPresenterProcotol: AnyObject {
    
}

class ItemDetailPresenter: ItemDetailPresenterProcotol {
    
    var router: ItemDetailRouterProtocol?
    var interactor: ItemDetailInteractorProcotol?
    var view: ItemDetailViewProtocol?
    
}
