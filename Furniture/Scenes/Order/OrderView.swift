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
  @Environment(\.presentationMode) var presentation
  @State private var isPresentingAddProduct: Bool = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.order.products, id: \.id) { orderProduct in
          NavigationLink(destination: ProductDetail(product: orderProduct.product)) {
            ProductView(viewModel: orderProduct.getViewModel())
          }.padding(.horizontal)
        }
        .onMove(perform: viewModel.moveProduct)
        .onDelete(perform: viewModel.deleteProduct)
      }
      .navigationBarTitle(
        Text(viewModel.order.formattedTotal)
          .accessibilityLabel("Total for order: \(viewModel.order.formattedTotal)")
      )
      .navigationBarItems(leading: EditButton(),
        trailing:
        Button(action: { self.isPresentingAddProduct.toggle() }) {
          Image(systemName: "plus")
        }
                            .accessibilityHint("Tap to add a product to the order")
      )
    }
    .sheet(isPresented: self.$isPresentingAddProduct,
           content: { AddProductView(isPresenting: self.$isPresentingAddProduct,
                                     viewModel: AddProductViewModel())}
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    OrderView(viewModel: OrderViewModel(dependencies: testOrderViewModelDependencies))
  }
}
