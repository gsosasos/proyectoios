//
//  CartConfigurator.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

class CartConfigurator {
    static func build() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        
        let router = CartRouter()
        let interactor = CartInteractor()
        
        let presenter = CartPresenter()
        
        let database = UserDefaultDataBase()
        
        view.presenter = presenter
        view.database = database
        interactor.presenter = presenter
        router.presenter = presenter
        router.view = view
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
      
        return view
    }
}
