//
//  FeedSectionFactory.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct FeedSectionFactory: FeedSectionVisitor {
  func visit(bannerSection: BannerSection, data: (geometry: GeometryProxy, sizeClass: UserInterfaceSizeClass)) -> AnyView {
    let isRegulardWith = data.sizeClass == .regular
    return AnyView(
      BannerFeedSection(section: bannerSection)
        .frame(height: isRegulardWith ? 400 : nil)
    )
  }
  
  func visit(storeSection: StoreSection, data: (geometry: GeometryProxy, sizeClass: UserInterfaceSizeClass)) -> AnyView {
    let isRegulardWith = data.sizeClass == .regular
    return AnyView(
      StoreFeedSection(section: storeSection, cellWidth: data.geometry.size.width * (isRegulardWith ? 0.4 : 0.85))
    )
  }
  
  func visit(featuredProductSection: FeaturedProductSection, data: (geometry: GeometryProxy, sizeClass: UserInterfaceSizeClass)) -> AnyView {
    let isRegulardWith = data.sizeClass == .regular
    return AnyView(
      FeaturedProductFeedSection(section: featuredProductSection, cellWidth: data.geometry.size.width * (isRegulardWith ? 0.175 : 0.45))
    )
  }
  
  func visit(optionSection: OptionSection, data: (geometry: GeometryProxy, sizeClass: UserInterfaceSizeClass)) -> AnyView {
    let isRegulardWith = data.sizeClass == .regular
    return AnyView(
      OptionFeedSection(section: optionSection, columns: isRegulardWith ? 2 : 1, cellWidth: data.geometry.size.width * (isRegulardWith ? 0.5 : 1.0))
    )
  }
}
