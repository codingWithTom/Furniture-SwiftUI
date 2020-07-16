//
//  OrderViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-15.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation
import SwiftUI

final class OrderViewModel: ObservableObject {
  @Published var order: Order
  var productService: ProductService = ProductServiceAdapter()
  private lazy var products: [Product] = {
    return productService.getProducts()
  }()
  
  init(order: Order = .init(products: [])) {
    self.order = order
  }
  
  func addProduct() {
    guard let randomProduct = products.randomElement() else { return }
    order.products.append(randomProduct)
  }
  
  func deleteProduct(at indexSet: IndexSet) {
    order.products.remove(atOffsets: indexSet)
  }
  
  func moveProduct(from indexSet: IndexSet, to offset: Int) {
    order.products.move(fromOffsets: indexSet, toOffset: offset)
  }
}
