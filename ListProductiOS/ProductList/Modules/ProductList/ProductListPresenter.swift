//
//  ProductListPresenter.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class ProductListPresenter {
    var view: ProductListPresenterToView?
    var interactor: ProductListPresenterToInteractor?
    var router: ProductListPresenterToRouter?
}

extension ProductListPresenter: ProductListViewToPresenter {}
extension ProductListPresenter: ProductListInteractorToPresenter {}
extension ProductListPresenter: ProductListRouterToPresenter {}
