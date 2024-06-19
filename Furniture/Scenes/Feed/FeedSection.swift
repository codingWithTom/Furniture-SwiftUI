//
//  FeedSection.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol FeedItem: Codable, Hashable {
  var title: String { get }
  func accept<V: FeedItemVisitor>(visitor: V, data: V.Data) -> V.Outcome
}

protocol FeedSection {
  var id: UUID { get }
  var name: String? { get }
  var sectionItems: [any FeedItem] { get }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome
}

struct BannerSection: FeedSection {
  let id = UUID()
  let name: String?
  let items: [BannerItem]
  var sectionItems: [any FeedItem] { items }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(bannerSection: self, data: data)
  }
}

struct BannerItem: FeedItem {
  var id: String { title + subtitle + imageName }
  let title: String
  let subtitle: String
  let imageName: String
  
  func accept<V: FeedItemVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    visitor.visit(bannerItem: self, data: data)
  }
}

struct StoreSection: FeedSection {
  let id = UUID()
  let name: String?
  let items: [StoreItem]
  var sectionItems: [any FeedItem] { items }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(storeSection: self, data: data)
  }
}

struct StoreItem: FeedItem, Codable {
  var id: String { title + subtitle + imageName }
  let title: String
  let subtitle: String
  let imageName: String
  
  func accept<V: FeedItemVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    visitor.visit(storeItem: self, data: data)
  }
}

struct FeaturedProductSection: FeedSection {
  let id = UUID()
  let name: String?
  let items: [FeaturedProductItem]
  var sectionItems: [any FeedItem] { items }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(featuredProductSection: self, data: data)
  }
}

struct FeaturedProductItem: FeedItem {
  var id: String { title + subtitle + imageName }
  let title: String
  let subtitle: String
  let imageName: String
  
  func accept<V: FeedItemVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    visitor.visit(featuredProductItem: self, data: data)
  }
}

struct OptionSection: FeedSection {
  let id = UUID()
  let name: String?
  let items: [OptionItem]
  var sectionItems: [any FeedItem] { items }
  
  func accept<V: FeedSectionVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    return visitor.visit(optionSection: self, data: data)
  }
}

struct OptionItem: FeedItem {
  var id: String { title + systemImageName }
  let title: String
  let systemImageName: String
  
  func accept<V: FeedItemVisitor>(visitor: V, data: V.Data) -> V.Outcome {
    visitor.visit(optionItem: self, data: data)
  }
}
