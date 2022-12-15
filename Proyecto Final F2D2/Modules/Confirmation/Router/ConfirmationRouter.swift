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
        
        //Borramos los valores del carrito
        UserDefaults.standard.removeObject(forKey: AppConstants.SHOPPING_CART)
        
        // Vamos a la página principal de manera segura
        // https://stackoverflow.com/questions/30003814/how-can-i-pop-specific-view-controller-in-swift
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
