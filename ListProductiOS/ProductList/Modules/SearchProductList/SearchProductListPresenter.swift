//
//  SearchProductListPresenter.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class SearchProductListPresenter {
    var view: SearchProductListPresenterToView?
    var interactor: SearchProductListPresenterToInteractor?
    var router: SearchProductListPresenterToRouter?
}

extension SearchProductListPresenter: SearchProductListViewToPresenter {
    func goToProductList(product: [ProductModel], delegate: ProductSelectionDelegate?) {
        guard let navigationController = (view as? SearchProductListViewController)?.navigationController else { return }
        router?.goToProductList(product: product, navigation: navigationController, delegate: delegate)
    }
    
    func getDataProduct() {
        interactor?.getDataProduct()
    }
}
extension SearchProductListPresenter: SearchProductListInteractorToPresenter {
    func responseData(productList: ProductListResponse) {
        view?.loadData(productList: productList)
    }
    
    func responseError(message: String) {
        
    }
}
extension SearchProductListPresenter: SearchProductListRouterToPresenter {}
