//
//  ConfirmationConfigurator.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 14/12/22.
//

import UIKit

class ConfirmationConfigurator {
    
    static func build() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ConfirmationViewController") as! ConfirmationViewController
        
        let router = ConfirmationRouter()
        let interactor = ConfirmationInteractor()
        
        let presenter = ConfirmationPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.view = view
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        return view
    }
}
