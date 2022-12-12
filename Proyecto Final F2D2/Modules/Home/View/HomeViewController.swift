//
//  HomeViewController.swift
//  Proyecto Final F2D2
//
//  Created by Geraldo Emilio Sosa Sosa on 12/12/22.
//

import UIKit

protocol HomeViewProtocol {
    
}

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    var router: HomeRouterProtocol?
    
    @IBOutlet weak var collection: UICollectionView!
    
    var data: [ProductResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(showCart))

        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        collection.collectionViewLayout = layout
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        getData()
    }
    
    @objc
    private func showCart() {
        print("showCart")
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func getData() {
        if let products = presenter?.getProducts() {
            data = products
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let item = data[indexPath.row]
        
        cell.backgroundColor = .lightGray
        cell.imgProduct.image = UIImage(named: "sinfoto")
        cell.lblTitle.text = item.name
        cell.lblPrice.text = "S/ \(item.price)" 
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped!", indexPath)
        presenter?.presentItemDetail()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 150)
    }
}
