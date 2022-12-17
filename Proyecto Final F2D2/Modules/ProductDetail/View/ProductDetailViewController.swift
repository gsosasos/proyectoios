//
//  ItemDetailView.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol ProductDetailViewProtocol: AnyObject {
    
}

class ProductDetailViewController: UIViewController {
    
    static let identifier = "ProductDetailViewController"
    
    weak var presenter: ProductDetailPresenterProcotol?
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var database: DataBase?
    var product: ProductResponse?
    var qty = 1
    var products: [CartProductEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        if let cart = UserDefaults.standard.object(forKey: AppConstants.SHOPPING_CART) as? Data {
            let decoder = JSONDecoder()
            if let shoppingcart = try? decoder.decode(CartEntity.self, from: cart) {
                self.products = shoppingcart.products
            }
            
        }
        stepper.addTarget(self, action: #selector(updateStep), for: .valueChanged)
    }
    
    func configuration() {
        navigationItem.title = product?.name
        lblPrice.text = "S/ \(product?.price ?? 0)"
        imgProduct.image = UIImage(named: product?.image ?? "sinfoto")
    }
    
    @objc
    private func updateStep(_ sender: UIStepper) {
        qty = Int(sender.value)
        lblQuantity.text = "\(qty)"
    }
    
    private func resetStepper() {
        qty = 1
        stepper.value = 1
        lblQuantity.text = "\(qty)"
    }
    
    private func successSaveData() -> Bool {
        //print(self.products)
        
        if let p = self.product, var (i, cart) = validateIfProductExist(p) {
            cart.products[i].quantity = qty
            self.products = cart.products
            //print(">>> Product Modified!", cart.products[i].id)
        } else {
            let p = CartProductEntity(id: self.product?.id ?? 0, name: self.product?.name ?? "", image: self.product?.image ?? "sinfoto", price: self.product?.price ?? 0, quantity: self.qty)
            //print(">>> new Product added!", self.product?.id)
            self.products.append(p)
        }
        
        let cart = CartEntity(total: 0, products: self.products)
        
        let encoder = JSONEncoder()
        if let dataEncoded = try? encoder.encode(cart) {
            database?.saveData(dataEncoded, key: AppConstants.SHOPPING_CART)
            
            return true
           
        }
        
        return false
    }
    
    private func validateIfProductExist(_ product: ProductResponse) -> (index: Int, cart: CartEntity)? {
        if let cart = UserDefaults.standard.object(forKey: AppConstants.SHOPPING_CART) as? Data {
            let decoder = JSONDecoder()
            let shoppingcart = try? decoder.decode(CartEntity.self, from: cart)
            let index = shoppingcart?.products.firstIndex(where: { $0.id == product.id })
            
            return (index, shoppingcart) as? (index: Int, cart: CartEntity)
        }
        
        return nil
    }
    
    private func totalProducts() {
        if let cart = UserDefaults.standard.object(forKey: AppConstants.SHOPPING_CART) as? Data {
            let decoder = JSONDecoder()
            if let shoppingcart = try? decoder.decode(CartEntity.self, from: cart) {
                //print(shoppingcart)
                var total = 0.00
                // Sumar elementos en un array
                // https://stackoverflow.com/questions/24795130/finding-sum-of-elements-in-swift-array
                let totalvar = shoppingcart.products.map {
                    Double($0.quantity) * $0.price
                }
                total = totalvar.reduce(.zero,+).rounded()
                
                let cart = CartEntity(total: total, products: self.products)
                
                let encoder = JSONEncoder()
                if let dataEncoded = try? encoder.encode(cart) {
                    database?.saveData(dataEncoded, key: AppConstants.SHOPPING_CART)
                }
             
            }
            
            
        }
        
 
    }
    
    
    @IBAction func didAddButtonTap(_ sender: Any) {
        
        var dialogMessage = UIAlertController(title: "Error", message: "¡Vuelve a intentarlo!", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.resetStepper()
        })
        
        if successSaveData() {
            dialogMessage = UIAlertController(title: "Ok", message: "Se añadió al carrito.", preferredStyle: .alert)
            totalProducts()
        }
        
        dialogMessage.addAction(ok)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol {
    
    
    
}
