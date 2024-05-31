//
//  SearchProductListViewController.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class SearchProductListViewController: UIViewController {
    
    static let nibNAme = "SearchProductListViewController"
    @IBOutlet weak var searchProductButton: UIButton!
    
    var presenter: SearchProductListViewToPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    func styleView() {
        searchProductButton.layer.cornerRadius = 10
        searchProductButton.layer.borderWidth = 1
        searchProductButton.layer.borderColor = UIColor.blue.cgColor
    }
    
    public func initWithNibName() -> SearchProductListViewController {
        return SearchProductListViewController(nibName: nibName, bundle: .localBundle)
    }
    
    
    @IBAction func searchProductActionButton(_ sender: UIButton) {
        showGenericSpinner()
        presenter?.getDataProduct()
    }
}

extension SearchProductListViewController: SearchProductListPresenterToView {
    func loadData(productList: ProductListResponse) {
        print(productList)
        removeGenericSpinner()
        presenter?.goToProductList(product: productList.resultado.productos ?? [])
    }
    
    func loadError(message: String) {
        removeGenericSpinner()
        print(message)
        showSimpleAlert(title: "Aviso", message: message)
    }
}
