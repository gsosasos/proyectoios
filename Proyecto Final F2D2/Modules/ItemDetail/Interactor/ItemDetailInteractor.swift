//
//  Interactor.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol ItemDetailInteractorProcotol: AnyObject {
    
}


class ItemDetailInteractor: ItemDetailInteractorProcotol {
    weak var presenter: ItemDetailPresenterProcotol?
    var api: RemoteRepository
    
    required init(presenter: ItemDetailPresenter, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}
