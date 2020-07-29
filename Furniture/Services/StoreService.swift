//
//  StoreService.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-28.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol StoreService {
  func getStores() -> [Store]
}

final class StoreServiceAdapter: StoreService {
  static let shared = StoreServiceAdapter()
  
  private lazy var stores: [Store] = {
    return [
      Store(lat: 37.790341, lon: -122.413331, name: "Pine St. Store", address: "1071 Pine St - San Francisco, CA", isOpen: true),
      Store(lat: 37.789216, lon: -122.407982, name: "Union Sq. Store", address: "447 Sutter St #999 - San Francisco, CA", isOpen: true),
      Store(lat: 37.789663, lon: -122.411915, name: "Bush St. Store", address: "895 Bush St - San Francisco, CA", isOpen: false),
      Store(lat: 37.787529, lon: -122.415180, name: "Post St. Store", address: "800 Post St - San Francisco, CA", isOpen: true),
      Store(lat: 37.786821, lon: -122.411640, name: "Geary St. Store", address: "501 Geary St - San Francisco, CA", isOpen: false),
      Store(lat: 37.790984, lon: -122.409115, name: "Powell St. Store", address: "693 Powell St - San Francisco, CA", isOpen: true),
      Store(lat: 37.792594, lon: -122.411862, name: "Huntington St. Store", address: "Sacramento St & Sproule Ln - San Francisco, CA", isOpen: false)
    ]
  }()
  
  private init() {}
  
  func getStores() -> [Store] {
    return stores
  }
}
