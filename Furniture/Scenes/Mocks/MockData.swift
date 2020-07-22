//
//  MockData.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-22.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation
import Combine

var testOrder = Order(products: [
  OrderProduct(product: Product(name: "Bench", price: 20.5, imageName: "bench", description: ""), quantity: 5),
  OrderProduct(product: Product(name: "Coffee Table", price: 40.0, imageName: "coffeeTable", description: ""), quantity: 1),
  OrderProduct(product: Product(name: "Dinning Table", price: 55.0, imageName: "dinningTable", description: ""), quantity: 2),
  OrderProduct(product: Product(name: "Director Chair", price: 75.0, imageName: "directorChair", description: ""), quantity: 1),
  OrderProduct(product: Product(name: "Orange Chair", price: 33.95, imageName: "orangeChair", description: ""), quantity: 3),
])

var testOrderViewModelDependencies: OrderViewModel.Dependencies {
  return OrderViewModel.Dependencies(
    orderService: testOrderService)
}

let testOrderService: OrderService = TestOrderService()

var testAddProdcut: AddProduct {
  let dependencies = AddProductAdapter.Dependencies(orderService: testOrderService)
  return AddProductAdapter(dependencies: dependencies)
}

private class TestOrderService: OrderService {
  private var order = testOrder
  private lazy var publisher: CurrentValueSubject<Order, Never> = CurrentValueSubject(order)
  
  func getOrderPublisher() -> AnyPublisher<Order, Never> {
    return publisher.eraseToAnyPublisher()
  }
  
  func getOrder() -> Order {
    return order
  }
  
  func saveOrder(order: Order) {
    self.order = order
    publisher.send(order)
  }
}

