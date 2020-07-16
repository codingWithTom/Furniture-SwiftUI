//
//  OrderView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-15.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct OrderView: View {
  @ObservedObject var viewModel: OrderViewModel
  
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.order.products, id: \.id) { product in
          NavigationLink(destination: ProductDetail(product: product)) {
            ProductView(viewModel: product.getViewModel())
          }.padding(.horizontal)
        }
        .onMove(perform: viewModel.moveProduct)
        .onDelete(perform: viewModel.deleteProduct)
      }
      .navigationBarTitle(viewModel.order.formattedTotal)
      .navigationBarItems(leading: EditButton(),
        trailing:
        Button(action: viewModel.addProduct) {
          Image(systemName: "plus")
        }
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    OrderView(viewModel: OrderViewModel(order: testOrder))
  }
}

private var testOrder = Order(products: [
  Product(name: "Bench", price: 20.5, imageName: "bench", description: ""),
  Product(name: "Coffee Table", price: 40.0, imageName: "coffeeTable", description: ""),
  Product(name: "Dinning Table", price: 55.0, imageName: "dinningTable", description: ""),
  Product(name: "Director Chair", price: 75.0, imageName: "directorChair", description: ""),
  Product(name: "Orange Chair", price: 33.95, imageName: "orangeChair", description: ""),
  ])

