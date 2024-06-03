//
//  SearchProductListProtocols.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

protocol SearchProductListViewToPresenter {
    func getDataProduct()
    func goToProductList(product: [ProductModel], delegate: ProductSelectionDelegate?)
}
protocol SearchProductListInteractorToPresenter {
    func responseData(productList: ProductListResponse)
    func responseError(message: String)
}
protocol SearchProductListRouterToPresenter {}
protocol SearchProductListPresenterToView {
    func loadData(productList: ProductListResponse)
    func loadError(message: String)
}
protocol SearchProductListPresenterToInteractor {
    func getDataProduct() 
}
protocol SearchProductListPresenterToRouter {
    func goToProductList(product: [ProductModel], navigation: UINavigationController, delegate: ProductSelectionDelegate?)
}
