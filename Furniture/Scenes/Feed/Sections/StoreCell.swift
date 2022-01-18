//
//  StoreCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct StoreCell: View {
  let store: StoreItem
  
  var body: some View {
    HStack {
      Image(store.imageName)
        .resizable()
        .frame(width: 100, height: 100)
        .aspectRatio(contentMode: .fill)
        .cornerRadius(16.0)
        .accessibilityHidden(true)
      
      VStack(alignment: .leading) {
        Text(store.title)
          .font(.headline)
        Text(store.subtitle)
          .font(.subheadline)
      }
      Spacer()
    }
    .accessibilityElement(children: .combine)
  }
}

struct StoreCell_Previews: PreviewProvider {
  static var previews: some View {
    StoreCell(store: StoreItem(title: "Store 0 title", subtitle: "Store 0 subtitle", imageName: "Store0"))
  }
}
