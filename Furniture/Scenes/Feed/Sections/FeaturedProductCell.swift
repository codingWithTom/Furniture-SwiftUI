//
//  FeaturedProductCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct FeaturedProductCell: View {
  let product: FeaturedProductItem
  
  var body: some View {
    VStack(alignment: .leading) {
      Image(product.imageName)
        .resizable()
        .cornerRadius(20.0)
        .accessibilityHidden(true)
      Text(product.title)
        .font(.headline)
      Text(product.subtitle)
        .font(.subheadline)
    }
    .accessibilityElement(children: .combine)
  }
}

struct FeaturedProductCell_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedProductCell(product: FeaturedProductItem(title: "Dining Room", subtitle: "Dining room subtitle", imageName: "diningRoom"))
  }
}
