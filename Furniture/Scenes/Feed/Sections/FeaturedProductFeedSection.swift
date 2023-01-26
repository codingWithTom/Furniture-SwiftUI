//
//  FeaturedProductFeedSection.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct FeaturedProductFeedSection: View {
  let section: FeaturedProductSection
  let cellWidth: CGFloat
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack(alignment: .leading) {
        Text(section.name ?? "")
          .font(.title)
          .padding(.leading)
          .accessibilityAddTraits(.isHeader)
        HStack(spacing: 16.0) {
          ForEach(section.items, id: \.id) { product in
            NavigationLink(value: product) {
              FeaturedProductCell(product: product)
                .frame(width: cellWidth, height: 250)
            }
          }
        }
      }
    }
  }
}

struct FeaturedProductFeedSection_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedProductFeedSection(
      section: FeaturedProductSection(
        name: "Featured Products",
        items: [
          FeaturedProductItem(title: "Dining Room", subtitle: "Stunning dining table and chairs", imageName: "diningRoom"),
          FeaturedProductItem(title: "Kitchen Tools", subtitle: "Must-have set of kitchen tools", imageName: "kitchenTools"),
          FeaturedProductItem(title: "Living Room", subtitle: "Everything you need for a living room, no matter the place!", imageName: "livingRoom"),
          FeaturedProductItem(title: "Moving Tools", subtitle: "Make sure to buy these before moving to your new home!", imageName: "movingTools"),
          FeaturedProductItem(title: "Power Drill", subtitle: "Save yourself a lot of effort", imageName: "powerDrill"),
          FeaturedProductItem(title: "Table decorations", subtitle: "Perfect for the center of the table", imageName: "tableDecoration"),
          FeaturedProductItem(title: "Tool box", subtitle: "For every do-it-yourself person", imageName: "toolBox"),
          FeaturedProductItem(title: "Wicker furniture", subtitle: "Wicker is what your patio needs", imageName: "wicker")
        ]),
      cellWidth: 200
    )
  }
}
