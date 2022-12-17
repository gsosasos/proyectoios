//
//  ItemDetailConfigurator.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

class ProductDetailConfigurator {
    static func makeProductDetail(product: ProductResponse) -> UIViewController {
        
        let presenter = ProductDetailPresenter()
        
        let api = MarketMOCK()
        let interactor = ProductDetailInteractor(presenter: presenter, api: api)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: ProductDetailViewController.identifier) as! ProductDetailViewController
        
        let router = ProductDetailRouter()
        let database = UserDefaultDataBase()
        
        router.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        view.product = product
        view.database = database
        
        return view
        
    }
}
