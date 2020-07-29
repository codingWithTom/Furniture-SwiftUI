//
//  StoresViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-28.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

final class StoresViewModel {
  struct Dependencies {
    var storeService: StoreService = StoreServiceAdapter.shared
    var applicationService: ApplicationService = ApplicationServiceAdapter()
  }
  let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func getStores() -> [StoreAnnotationViewModel] {
    return dependencies.storeService.getStores().map {
      StoreAnnotationViewModel(latitude: $0.lat, longitude: $0.lon, name: $0.name,
                               address: $0.address, isOpen: $0.isOpen)
    }
  }
  
  func tapped(annotation: StoreAnnotationViewModel) {
    if annotation.isOpen {
      dependencies.applicationService.call(phoneNumber: "1111111111")
    } else {
      dependencies.applicationService.go(to: "https://apple.com")
    }
  }
}
