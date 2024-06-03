//
//  Extensions.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

extension Bundle {
    static let localBundle = Bundle.init(for: OpenClassProductList.self)
}

// MARK: Extension for function Alert Simple
public let spinnerGeneric: Int = 83

extension UIViewController {

    func showGenericSpinner() {
        let spinnerView = UIView()
        view.addSubview(spinnerView)

        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinnerView.topAnchor.constraint(equalTo: view.topAnchor),
            spinnerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spinnerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spinnerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)

        let ai = UIActivityIndicatorView.init(style: .whiteLarge)

        spinnerView.addSubview(ai)
        ai.startAnimating()
        ai.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ai.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor),
            ai.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor),
            ai.widthAnchor.constraint(equalToConstant: 30),
            ai.heightAnchor.constraint(equalToConstant: 30)
        ])
        spinnerView.tag = spinnerGeneric
    }

    func removeGenericSpinner() {
        if let spinner = view.viewWithTag(spinnerGeneric){
            spinner.removeFromSuperview()
        }
    }
    
    func showSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "Aceptar", style: .default)
        alert.addAction(accionAceptar)
        present(alert, animated: true)
    }
}

// MARK: Extension convert urlString To Image
extension UIImageView {
    func loadString(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
