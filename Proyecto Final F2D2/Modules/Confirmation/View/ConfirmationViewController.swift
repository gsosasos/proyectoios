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
    
    @IBOutlet weak var purchaseNumber: UITextField!
    
    override func viewDidLoad() {
        // Genero numero random para la orden
        var purchaseRamdomNumber = Int.random(in: 10000...99999)
        
        //Ocultamos la navegación y colocamos un icono de confirmación
        navigationItem.hidesBackButton = true
        image.image = UIImage(systemName: "checkmark")
        purchaseNumber.text = String(purchaseRamdomNumber)
    }
    
    
    @IBAction func didTabBackToHome(_ sender: Any) {
        presenter?.presentGoToHome()
    }
}

extension ConfirmationViewController: ConfirmationViewProtocol {
    
    
}
