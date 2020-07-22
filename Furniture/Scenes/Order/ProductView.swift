//
//  ProductView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-15.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct ProductViewModel {
  let name: String
  let imageName: String
  let price: String
  let quantity: Int
}

struct ProductView: View {
  let viewModel: ProductViewModel
  var body: some View {
    HStack {
      if viewModel.quantity > 1 {
        Text("\(viewModel.quantity)")
          .font(.title)
      }
      Image(viewModel.imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 80, height: 80)
      VStack {
        HStack {
          Text(viewModel.name)
          Spacer()
        }
        HStack {
          Spacer()
          Text(viewModel.price)
        }
      }
    }
  }
}

struct ProductView_Previews: PreviewProvider {
  static var previews: some View {
    ProductView(viewModel: ProductViewModel(name: "bench", imageName: "bench", price: "$40.0", quantity: 1))
  }
}
