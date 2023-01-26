//
//  FeedView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct FeedView: View {
  @Environment(\.horizontalSizeClass) private var horizontalSizeClass
  let viewModel: FeedViewModel
  @State private var path = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $path) {
      GeometryReader { geometry in
        ScrollView(showsIndicators: false) {
          VStack {
            ForEach(viewModel.getSections(), id: \.name) { section in
              section.accept(visitor: FeedSectionFactory(), data: (geometry: geometry, sizeClass: horizontalSizeClass ?? .compact))
            }
          }
        }
      }
      .navigationDestination(for: BannerItem.self) { item in
        FeedItemFactory(suggestedItems: viewModel.getRandomItems(), onPopToRoot: popToRoot).buildViewForItem(item)
      }
      .navigationDestination(for: StoreItem.self) { item in
        FeedItemFactory(suggestedItems: viewModel.getRandomItems(), onPopToRoot: popToRoot).buildViewForItem(item)
      }
      .navigationDestination(for: FeaturedProductItem.self) { item in
        FeedItemFactory(suggestedItems: viewModel.getRandomItems(), onPopToRoot: popToRoot).buildViewForItem(item)
      }
      .navigationDestination(for: OptionItem.self) { item in
        FeedItemFactory(suggestedItems: viewModel.getRandomItems(), onPopToRoot: popToRoot).buildViewForItem(item)
      }
    }
  }
  
  func popToRoot() {
    path = NavigationPath()
  }
}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView(viewModel: FeedViewModel())
      .preferredColorScheme(.light)
  }
}
