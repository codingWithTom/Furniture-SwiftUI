//
//  FeedSection.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol FeedSection {
  var id: UUID { get }
  var name: String? { get }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome
}

struct BannerSection: FeedSection {
  let id = UUID()
  let name: String?
  let items: [BannerItem]
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(bannerSection: self, data: data)
  }
}

struct BannerItem {
  let id = UUID()
  let title: String
  let subtitle: String
  let imageName: String
}

struct StoreSection: FeedSection {
  let id = UUID()
  let name: String?
  let items: [StoreItem]
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(storeSection: self, data: data)
  }
}

struct StoreItem {
  let id = UUID()
  let title: String
  let subtitle: String
  let imageName: String
}

struct FeaturedProductSection: FeedSection {
  let id = UUID()
  let name: String?
  let items: [FeaturedProductItem]
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(featuredProductSection: self, data: data)
  }
}

struct FeaturedProductItem {
  let id = UUID()
  let title: String
  let subtitle: String
  let imageName: String
}

struct OptionSection: FeedSection {
  let id = UUID()
  let name: String?
  let items: [OptionItem]
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(optionSection: self, data: data)
  }
}

struct OptionItem {
  let id = UUID()
  let title: String
  let systemImageName: String
}
