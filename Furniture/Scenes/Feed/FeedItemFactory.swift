//
//  FeedItemFactory.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2023-01-26.
//  Copyright © 2023 CodingWithTom. All rights reserved.
//

import SwiftUI

private extension FeedItem {
  func navigationLinkForItem() -> AnyView {
    AnyView(NavigationLink(title, value: self))
  }
}

struct FeedItemFactory: FeedItemVisitor {
  let suggestedItems: [any FeedItem]
  let onPopToRoot: () -> Void
  
  func buildViewForItem(_ item: some FeedItem) -> some View {
    VStack {
      item.accept(visitor: self, data: ())
      ScrollView(.horizontal) {
        HStack {
          ForEach(suggestedItems.indices, id: \.self) { index in
            let item = suggestedItems[index]
            item.navigationLinkForItem()
          }
        }
      }
    }
      .navigationTitle(item.title)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: onPopToRoot) {
            Text("Back to Feed")
          }
        }
      }
  }
  
  func visit(bannerItem: BannerItem, data: Void) -> AnyView {
    AnyView(
      BannerItemView(bannerItem: bannerItem)
    )
  }
  
  func visit(storeItem: StoreItem, data: ()) -> AnyView {
    AnyView(
      StoreItemView(storeItem: storeItem)
    )
  }
  
  func visit(optionItem: OptionItem, data: ()) -> AnyView {
    AnyView(
      OptionItemView(optionItem: optionItem)
    )
  }
  
  func visit(featuredProductItem: FeaturedProductItem, data: ()) -> AnyView {
    AnyView(
      FeaturedProductItemView(featuredItem: featuredProductItem)
    )
  }
}
