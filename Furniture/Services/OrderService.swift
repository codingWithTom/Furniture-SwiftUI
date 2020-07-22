//
//  OrderService.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-22.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation
import Combine

protocol OrderService {
  func getOrder() -> Order
  func getOrderPublisher() -> AnyPublisher<Order, Never>
  func saveOrder(order: Order)
}

final class OrderServiceAdapter: OrderService {
  static let shared = OrderServiceAdapter()
  private lazy var orderPublisher: CurrentValueSubject<Order, Never> = CurrentValueSubject(order)
  private var order = Order(products: [])
  
  func getOrder() -> Order {
    return order
  }
  
  func saveOrder(order: Order) {
    self.order = order
    orderPublisher.send(order)
  }
  
  func getOrderPublisher() -> AnyPublisher<Order, Never> {
    return orderPublisher.eraseToAnyPublisher()
  }
}
