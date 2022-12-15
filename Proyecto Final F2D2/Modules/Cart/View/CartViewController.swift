//
//  CartViewController.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol CartViewProtocol: AnyObject {
    
}

class CartViewController: UIViewController {
    
    var presenter: CartPresenterProtocol?
    var database: DataBase?
    
    @IBOutlet weak var tableProducts: UITableView!
    
    var cart: CartEntity?
    
    override func viewDidLoad() {
        
        
        tableProducts.dataSource = self
        getCartFromDatabase()
        if let c = cart {
            navigationItem.title = "(\(c.products.count)) Carrito de compras"
        } else {
            navigationItem.title = "Carrito de compras"
        }
        
    }
    
    private func getCartFromDatabase() {
        if let shoppingCart = UserDefaults.standard.object(forKey: AppConstants.SHOPPING_CART) as? Data {
            let decoder = JSONDecoder()
            cart = try? decoder.decode(CartEntity.self, from: shoppingCart)
        }
    }
    
    @IBAction func didTabButton(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: AppConstants.SHOPPING_CART)
        self.cart = nil
        tableProducts.reloadData()
    }
    
    @IBAction func didTabButtonConfirmation(_ sender: Any) {
        presenter?.presentGoToConfirmation()
    }
    
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.cart?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cartProductsCell")
        let prod = self.cart?.products[indexPath.row]
        
        cell.textLabel?.text = "(\(prod!.quantity)) \(prod!.name)"
        cell.detailTextLabel?.text = "\(prod?.price ?? 0)"
        return cell
    }
    
    
}

extension CartViewController: CartViewProtocol {
    
}
