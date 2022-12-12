//
//  HomeRouter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol HomeRouterProtocol {
    func navItemDetail()
}

class HomeRouter: HomeRouterProtocol {
    var presenter: HomePresenterProtocol?
    var view: HomeViewController?
    
    func navItemDetail() {
        let itemDetail = ItemDetailConfigurator.makeItemDetail()
        
        if let sourceView = view {
            sourceView.navigationController?.pushViewController(itemDetail, animated: true)
        }
    }
}
