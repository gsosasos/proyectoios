//
//  CartRouter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol CartRouterProtocol {
    func navToConfirmation()
}

class CartRouter: CartRouterProtocol {
    
    weak var presenter: CartPresenterProtocol?
    var view: CartViewController?
    
    func navToConfirmation() {
        let vc = ConfirmationConfigurator.build()
        
        if let sourceView = view {
            sourceView.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
