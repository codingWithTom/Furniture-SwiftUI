//
//  StoreFeedSection.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct StoreFeedSection: View {
  let section: StoreSection
  let cellWidth: CGFloat
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack(alignment: .leading) {
        Text(section.name ?? "")
          .font(.title)
          .padding(.leading)
          .accessibilityAddTraits(.isHeader)
        LazyHGrid(rows: Array(repeating: GridItem(.fixed(100)), count: 3)) {
          ForEach(section.items, id: \.id) { store in
            NavigationLink(value: store) {
              StoreCell(store: store)
                .frame(width: cellWidth)
            }
          }
        }
      }
    }
  }
}

struct StoreFeedSection_Previews: PreviewProvider {
  static var previews: some View {
    StoreFeedSection(
    section: StoreSection(
      name: "Stores",
      items: [
        StoreItem(title: "Store 0 title", subtitle: "Store 0 subtitle", imageName: "Store0"),
        StoreItem(title: "Store 1 title", subtitle: "Store 0 subtitle", imageName: "Store1"),
        StoreItem(title: "Store 2 title", subtitle: "Store 0 subtitle", imageName: "Store2"),
        StoreItem(title: "Store 3 title", subtitle: "Store 0 subtitle", imageName: "Store3"),
        StoreItem(title: "Store 4 title", subtitle: "Store 0 subtitle", imageName: "Store4"),
        StoreItem(title: "Store 5 title", subtitle: "Store 0 subtitle", imageName: "Store5"),
        StoreItem(title: "Store 6 title", subtitle: "Store 0 subtitle", imageName: "Store6")
      ]),
      cellWidth: 300
    )
  }
}
