//
//  ProductDetail.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-15.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct ProductDetail: View {
  var product: Product
  @State private var isZoomed: Bool = false
  var body: some View {
    VStack {
      Spacer()
      Image(product.imageName)
        .resizable()
        .aspectRatio(contentMode: isZoomed ? .fill : .fit)
        .onTapGesture {
          withAnimation {
            self.isZoomed.toggle()
          }
      }
      Spacer()
      if !isZoomed {
        ScrollView {
          Text(product.description)
        }.transition(.move(edge: .bottom))
      }
    }
    .navigationBarTitle(product.name)
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ProductDetail_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetail(product: Product(name: "Bench", price: 40, imageName: "bench", description: "Hello World!"))
  }
}
