//
//  ItemDetailPresenter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol ProductDetailPresenterProcotol: AnyObject {

}

class ProductDetailPresenter: ProductDetailPresenterProcotol {
    
    var router: ProductDetailRouterProtocol?
    var interactor: ProductDetailInteractorProcotol?
    var view: ProductDetailViewProtocol?
    
}
