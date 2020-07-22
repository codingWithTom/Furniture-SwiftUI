//
//  OrderProduct.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-22.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

struct OrderProduct: Identifiable {
  let id = UUID()
  let product: Product
  var quantity: Int
  
  var total: Double {
    return product.price * Double(quantity)
  }
  var formattedTotal: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    return numberFormatter.string(from: NSNumber(value: total)) ?? "$0.00"
  }
}

extension OrderProduct {
  func getViewModel() -> ProductViewModel {
    return ProductViewModel(name: product.name, imageName: product.imageName, price: formattedTotal, quantity: quantity)
  }
}

