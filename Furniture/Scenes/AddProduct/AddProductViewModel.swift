//
//  AddProductViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-22.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation
import AVFoundation

struct RowViewModel: Identifiable {
  let id = UUID()
  let products: [Product]
}

final class AddProductViewModel {
  struct Dependencies {
    var productService: ProductService = ProductServiceAdapter.shared
    var addProduct: AddProduct = AddProductAdapter()
  }
  let dependencies: Dependencies
  private var player: AVPlayer?
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
    startPlayer()
  }
  
  func add(product: Product) {
    dependencies.addProduct.execute(product: product)
    playSound()
  }
  
  func getNumberOfProductsPerRow() -> Int {
    return 3
  }
  
  func getRows() -> [RowViewModel] {
    var rows: [RowViewModel] = []
    let numberOfItemsPerRow = getNumberOfProductsPerRow()
    let products = dependencies.productService.getProducts()
    let numberOfRows: Int = products.count / numberOfItemsPerRow
    for i in 0 ..< numberOfRows {
      let startIndex = i * numberOfItemsPerRow
      let endIndex = startIndex + numberOfItemsPerRow
      rows.append(RowViewModel(products: Array(products[startIndex ..< endIndex])))
    }
    let lastProducts = products.count % numberOfItemsPerRow
    if lastProducts != 0 {
      rows.append(RowViewModel(products: Array(products[products.count - lastProducts ..< products.count])))
    }
    return rows
  }
}

private extension AddProductViewModel {
  func startPlayer() {
    guard let url = Bundle.main.url(forResource: "TapSound", withExtension: "mp3") else { return }
    player = AVPlayer(url: url)
  }
  
  func playSound() {
    player?.play()
  }
}
