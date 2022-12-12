//
//  ItemDetailView.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol ItemDetailViewProtocol: AnyObject {
    
}

class ItemDetailViewController: UIViewController {
    
    weak var presenter: ItemDetailPresenterProcotol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ItemDetailViewController: ItemDetailViewProtocol {
    
}
