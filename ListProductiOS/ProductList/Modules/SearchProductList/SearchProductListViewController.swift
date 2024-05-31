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
    @IBOutlet weak var contentViewProductDetail: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var skuProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var mainWeeklyPayment: UILabel!
    
    var presenter: SearchProductListViewToPresenter?
    var delegate: ProductSelectionDelegate? 

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    func styleView() {
        searchProductButton.layer.cornerRadius = 10
        searchProductButton.layer.borderWidth = 1
        searchProductButton.layer.borderColor = UIColor.blue.cgColor
        contentViewProductDetail.isHidden = true
        contentViewProductDetail.layer.cornerRadius = 20
        contentViewProductDetail.layer.borderColor = UIColor.brown.cgColor
        contentViewProductDetail.layer.borderWidth = 3
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
        presenter?.goToProductList(product: productList.resultado.productos ?? [], delegate: self)
    }
    
    func loadError(message: String) {
        removeGenericSpinner()
        print(message)
        showSimpleAlert(title: "Aviso", message: message)
    }
}

extension SearchProductListViewController: ProductSelectionDelegate {
    func didSelectProduct(product: ProductModel) {
        contentViewProductDetail.isHidden = false
        productImage.loadString(url: URL(string: product.urlImagenes.first ?? "")!)
        nameProduct.text = product.nombre
        skuProduct.text = "SKU: " + product.sku
        priceProduct.text = " Precio: \(String(describing: product.precioFinal ?? 0.0))"
        mainWeeklyPayment.text = "Pago Semanal: \(String(describing: product.pagoSemanalPrincipal ?? 0))"
        
    }
}
