//
//  ConfirmationRouter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 14/12/22.
//

import UIKit

protocol ConfirmationRouterProtocol {
    func navToGoToHome()
}

class ConfirmationRouter: ConfirmationRouterProtocol {
    
    var presenter: ConfirmationPresenterProtocol?
    var view: ConfirmationViewController?
    
    func navToGoToHome() {
        
        UserDefaults.standard.removeObject(forKey: AppConstants.SHOPPING_CART)
        
        if let sourceView = view {
            for controller in sourceView.navigationController!.viewControllers as Array {
                        if controller.isKind(of: HomeViewController.self) {
                            sourceView.navigationController!.popToViewController(controller, animated: true)
                            break
                        }
                    }
        }
        
       
    }
}
