//
//  SearchProductListRouter.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class SearchProductListRouter {
    var presenter: SearchProductListRouterToPresenter?
    
    public func createModule() -> UIViewController {
        let view = SearchProductListViewController().initWithNibName()
        let presenter = SearchProductListPresenter()
        let interactor = SearchProductListInteractor()
        let router = SearchProductListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension SearchProductListRouter: SearchProductListPresenterToRouter {
    func goToProductList(product: [ProductModel], navigation: UINavigationController, delegate: ProductSelectionDelegate?) {
        let vc = ProductListRouter().createModule(productList: product, delegate: delegate)
        navigation.pushViewController(vc, animated: true)
    }
}
