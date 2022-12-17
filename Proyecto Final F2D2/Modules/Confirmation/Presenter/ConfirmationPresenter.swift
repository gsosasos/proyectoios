//
//  ConfirmationPresenter.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 14/12/22.
//

import UIKit

protocol ConfirmationPresenterProtocol:  AnyObject {
    func presentGoToHome()
}

class ConfirmationPresenter: ConfirmationPresenterProtocol {
    
    weak var view: ConfirmationViewProtocol?
    var router: ConfirmationRouterProtocol?
    weak var interactor: ConfirmationInteractorProtocol?
    
    func presentGoToHome() {
        router?.navToGoToHome()
    }
}
