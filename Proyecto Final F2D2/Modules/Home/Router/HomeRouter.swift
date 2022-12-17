//
//  HomeRouter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit
//Navegación
protocol HomeRouterProtocol {
    func navItemDetail(product: ProductResponse)
    func navCart()
}

class HomeRouter: HomeRouterProtocol {
    var presenter: HomePresenterProtocol?
    var view: HomeViewController?
    
    func navItemDetail(product: ProductResponse) {
        let itemDetail = ProductDetailConfigurator.makeProductDetail(product: product)
        
        if let sourceView = view {
            sourceView.navigationController?.pushViewController(itemDetail, animated: true)
        }
    }
    
    func navCart() {
        let vc = CartConfigurator.build()
        
        if let sourceView = view {
            sourceView.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
