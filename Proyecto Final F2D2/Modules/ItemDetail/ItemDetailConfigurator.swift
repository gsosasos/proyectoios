//
//  ItemDetailConfigurator.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

class ItemDetailConfigurator {
    static func makeItemDetail() -> UIViewController {
        
        let presenter = ItemDetailPresenter()
        
        let api = MarketMOCK()
        let interactor = ItemDetailInteractor(presenter: presenter, api: api)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
        
        let router = ItemDetailRouter()
        router.presenter = presenter
        
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        
        return view
        
    }
}
