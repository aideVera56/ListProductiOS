//
//  OpenClassProductList.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

public class OpenClassProductList {
    public static func openModule() -> UIViewController {
        return SearchProductListRouter().createModule()
    }
}

class WebServicesURLs {
    static let apiURL = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
}
