//
//  OpenClassProductList.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

public class OpenClassProductList {
    public static func openModule() -> UIViewController {
        return ProductListRouter().createModule()
    }
}
