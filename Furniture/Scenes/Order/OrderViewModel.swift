//
//  OrderViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-15.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class OrderViewModel: ObservableObject {
  struct Dependencies {
    var orderService: OrderService = OrderServiceAdapter.shared
  }
  let dependencies: Dependencies
  @Published var order: Order
  private var orderCancellable: AnyCancellable?
  
  init(dependencies: Dependencies = .init()) {
    self.order = Order(products: [])
    self.dependencies = dependencies
    listenOrderChanges()
  }
  
  func deleteProduct(at indexSet: IndexSet) {
    order.products.remove(atOffsets: indexSet)
    dependencies.orderService.saveOrder(order: order)
  }
  
  func moveProduct(from indexSet: IndexSet, to offset: Int) {
    order.products.move(fromOffsets: indexSet, toOffset: offset)
    dependencies.orderService.saveOrder(order: order)
  }
}

private extension OrderViewModel {
  func listenOrderChanges() {
    orderCancellable = dependencies.orderService.getOrderPublisher().assign(to: \.order, on: self)
  }
}
