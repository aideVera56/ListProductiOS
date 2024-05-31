//
//  SearchProductListInteractor.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class SearchProductListInteractor: SearchProductListPresenterToInteractor {
    
    var presenter: SearchProductListInteractorToPresenter?
    
    func getDataProduct() {
        print(WebServicesURLs.apiURL)
        let url = URL(string: WebServicesURLs.apiURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.presenter?.responseError(message: "Respuesta Invalida")
                return
            }

            let statusCode = httpResponse.statusCode
            
            if let error = error {
                print("Error:", error)
                DispatchQueue.main.async {
                    self.presenter?.responseError(message:"Error al obtener los datos")
                }
                
                return
            }
            
            guard let data = data else {
                print("No se recibieron Datos")
                DispatchQueue.main.async {
                    self.presenter?.responseError(message: "No se recibieron Datos")
                }
                return
            }
            
            do {
                let productData = try JSONDecoder().decode(ProductListResponse.self, from: data)
                print(productData)
                DispatchQueue.main.async {
                    print(productData)
                    self.presenter?.responseData(productList: productData)
                }
            } catch {
                print("Error al decodificar JSON:", error)
                DispatchQueue.main.async {
                    switch statusCode {
                    case 300...399:
                        self.presenter?.responseError(message: "Error al realizar peticion")
                    case 400...499:
                        self.presenter?.responseError(message: "No hay coincidencias")
                    case 500...599:
                        self.presenter?.responseError(message: "Servicio no disponible")
                    default:
                        self.presenter?.responseError(message: "Unexpected status code: \(statusCode)")
                    }
                }
            }
        }
        
        task.resume()
    }
}
