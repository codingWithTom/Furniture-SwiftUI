//
//  AddProduct.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-22.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol AddProduct {
  func execute(product: Product)
}

final class AddProductAdapter: AddProduct {
  struct Dependencies {
    var orderService: OrderService = OrderServiceAdapter.shared
  }
  let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute(product: Product) {
    var order = dependencies.orderService.getOrder()
    if let productIndex = order.products.firstIndex(where: { $0.product.id == product.id }) {
      var orderProduct = order.products.remove(at: productIndex)
      orderProduct.quantity += 1
      order.products.insert(orderProduct, at: productIndex)
    } else {
      order.products.append(OrderProduct(product: product, quantity: 1))
    }
    dependencies.orderService.saveOrder(order: order)
  }
}
