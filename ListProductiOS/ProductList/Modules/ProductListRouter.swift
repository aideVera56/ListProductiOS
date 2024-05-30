//
//  ProductListRouter.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class ProductListRouter {
    var presenter: ProductListRouterToPresenter?
    
    public func createModule() -> UIViewController {
        let view       = ProductListViewController().initWithNibName()
        let presenter  = ProductListPresenter()
        let interactor = ProductListInteractor()
        let router     = ProductListRouter()
        
        view.presenter          = presenter
        presenter.view          = view
        presenter.interactor    = interactor
        presenter.router        = router
        interactor.presenter    = presenter
        
        return view
    }
}

extension ProductListRouter: ProductListPresenterToRouter {}
