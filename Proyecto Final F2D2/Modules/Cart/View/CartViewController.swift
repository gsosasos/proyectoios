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
    
    @IBOutlet weak var confirmationCart: UIButton!
    @IBOutlet weak var cleanCart: UIButton!
    @IBOutlet weak var tableProducts: UITableView!
    @IBOutlet weak var fullPayment: UILabel!
    
    @IBOutlet weak var messageCart: UILabel!
    @IBOutlet weak var dateNow: UILabel!
    @IBAction func changeDocument(_ sender: Any) {
    }
    
    var cart: CartEntity?
    
    override func viewDidLoad() {
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM, yyyy - hh:mm:ss"
        let now = dateFormater.string(from: Date())
        
        tableProducts.dataSource = self
        getCartFromDatabase()
        if let c = cart {
            navigationItem.title = "(\(c.products.count)) Carrito de compras"
            cleanCart.alpha = 1
            confirmationCart.alpha = 1
            fullPayment.alpha = 1
            fullPayment.text = String(c.total)
            messageCart.alpha = 1
            dateNow.alpha = 1
            //print(c.total)
            dateNow.text = now
            
        } else {
            navigationItem.title = "Carrito de compras"
            cleanCart.alpha = 0
            confirmationCart.alpha = 0
            fullPayment.alpha = 0
            messageCart.alpha = 0
            messageCart.text = "No hay productos"
            dateNow.alpha = 0
            
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
        
        if(self.cart?.products.count == 0){
           //print("No hay productos")
        }
        
        return cell
    }
    
    
}

extension CartViewController: CartViewProtocol {
    
}
