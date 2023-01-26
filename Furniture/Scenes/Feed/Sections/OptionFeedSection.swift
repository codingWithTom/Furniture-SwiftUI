//
//  OptionFeedSection.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct OptionFeedSection: View {
  let section: OptionSection
  let columns: Int
  let cellWidth: CGFloat
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(section.name ?? "")
        .font(.title)
        .padding()
        .accessibilityAddTraits(.isHeader)
      LazyVGrid(columns: Array(repeating: GridItem(.fixed(cellWidth)), count: columns), alignment: .leading){
        ForEach(section.items, id: \.id) { option in
          NavigationLink(value: option) {
            VStack(alignment: .leading) {
              OptionCell(option: option)
              Divider()
            }
          }
        }
      }
    }
  }
}

struct OptionFeedSection_Previews: PreviewProvider {
  static var previews: some View {
    OptionFeedSection(
      section: OptionSection(
        name: "Quick Links",
        items: [
          OptionItem(title: "About Funiture Aeki", systemImageName: "info"),
          OptionItem(title: "Share Aeki with your friends", systemImageName: "square.and.arrow.up.fill"),
          OptionItem(title: "News", systemImageName: "book.circle"),
          OptionItem(title: "Privacy Policy", systemImageName: "lock.icloud"),
          OptionItem(title: "Contact Us", systemImageName: "person.crop.circle.fill")
        ]),
      columns: 2,
      cellWidth: 400)
  }
}
