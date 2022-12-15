//
//  ConfirmationViewController.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 14/12/22.
//

import UIKit

protocol ConfirmationViewProtocol: AnyObject {
    
}

class ConfirmationViewController: UIViewController {
    
    var presenter: ConfirmationPresenterProtocol?
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        //Ocultamos la navegación y colocamos un icono de confirmación
        navigationItem.hidesBackButton = true
        image.image = UIImage(systemName: "checkmark")
    }
    
    
    @IBAction func didTabBackToHome(_ sender: Any) {
        presenter?.presentGoToHome()
    }
}

extension ConfirmationViewController: ConfirmationViewProtocol {
    
    
}
