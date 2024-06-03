//
//  ProductTableViewCell.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var categoryProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func getData(product: ProductModel) {
        productImage.loadString(url: URL(string: product.urlImagenes.first ?? "")!)
        nameProduct.text = product.nombre
        priceProduct.text = "\(String(describing: product.precioFinal ?? 0.0))"
        categoryProduct.text = product.codigoCategoria
    }
    
}
