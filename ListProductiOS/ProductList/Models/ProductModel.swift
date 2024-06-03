//
//  ProductModel.swift
//  ListProductiOS
//
//  Created by Jessica Vera Perez on 30/05/24.
//

import UIKit

struct ProductListResponse: Codable {
  var resultado: ResultModel
}

struct ResultModel: Codable {
  var paginacion: PaginationModel?
  var categoria: String
  var productos: [ProductModel]?
}

struct PaginationModel: Codable {
  var pagina: Int
  var totalPaginas: Int
  var totalRegistros: Int
  var totalRegistrosPorPagina: Int
}

struct ProductModel: Codable {
  var id: String
  var idLinea: Int
  var codigoCategoria: String
  var idModalidad: Int
  var relevancia: Int
  var lineaCredito: String?
  var pagoSemanalPrincipal: Int
  var plazoPrincipal: Int
  var disponibleCredito: Bool
  var sku: String
  var nombre: String
  var urlImagenes: [String]
  var precioRegular: Int?
  var precioFinal: Double?
  var porcentajeDescuento: Double?
  var descuento: Bool
  var precioCredito: Double?
  var montoDescuento: Double?
  var abonosSemanales: [WeeklyPassesModel]
}


struct WeeklyPassesModel: Codable {
  var plazo: Int
  var montoAbono: Int
  var montoDescuentoAbono: Int
  var montoUltimoAbono: Int
  var montoFinalCredito: Int
  var idPromocion: Int
  var montoDescuentoElektra: Int
  var montoDescuentoBanco: Int
  var precio: Int
  var montoAbonoDigital: Int
}
