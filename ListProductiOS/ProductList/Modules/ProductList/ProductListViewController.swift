//
//  ProductListViewController.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class ProductListViewController: UIViewController {
    
    static let nibName = "ProductListViewController"
    @IBOutlet weak var productTableView: UITableView!
    var presenter: ProductListViewToPresenter?
    var productListArray: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableConfiguration()
    }
    
    public func initWithNibName() -> ProductListViewController {
        return ProductListViewController(nibName: nibName, bundle: .localBundle)
    }
    
    func tableConfiguration() {
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.rowHeight = 100
        productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: .localBundle), forCellReuseIdentifier: "cellProduct")
    }
    
}

extension ProductListViewController: ProductListPresenterToView {}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellProduct", for: indexPath) as! ProductTableViewCell
        let productData = productListArray[indexPath.row]
        cell.getData(product: productData)
        return cell
    }
}
