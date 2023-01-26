//
//  BannerItemView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2023-01-26.
//  Copyright © 2023 CodingWithTom. All rights reserved.
//

import SwiftUI

struct BannerItemView: View {
  let bannerItem: BannerItem
  
  var body: some View {
    VStack(alignment: .center) {
      Text("This is a banner! \(bannerItem.subtitle)")
      Image(bannerItem.imageName)
        .resizable()
        .scaledToFit()
      Text.loremIpsum()
    }
  }
}

struct StoreItemView: View {
  let storeItem: StoreItem
  
  var body: some View {
    VStack(alignment: .center) {
      Text("This is a store! \(storeItem.subtitle)")
      Image(storeItem.imageName)
        .resizable()
        .scaledToFit()
      Text.loremIpsum()
    }
  }
}

struct FeaturedProductItemView: View {
  let featuredItem: FeaturedProductItem
  
  var body: some View {
    VStack(alignment: .center) {
      Text("This is a featured product! \(featuredItem.subtitle)")
      Image(featuredItem.imageName)
        .resizable()
        .scaledToFit()
      Text.loremIpsum()
    }
  }
}

struct OptionItemView: View {
  let optionItem: OptionItem
  
  var body: some View {
    VStack(alignment: .center) {
      Text("This is an option!")
      Image(systemName: optionItem.systemImageName)
        .font(.largeTitle)
      Text.loremIpsum()
    }
  }
}

extension Text {
  static func loremIpsum() -> Text {
    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
  }
}
