//
//  ProductListViewController.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class ProductListViewController: UIViewController {
    
    static let nibName = "ProductListViewController"
    var presenter: ProductListViewToPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func initWithNibName() -> ProductListViewController {
        return ProductListViewController(nibName: nibName, bundle: .localBundle)
    }
    
}

extension ProductListViewController: ProductListPresenterToView {}
