//
//  FeedItemVisitor.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2023-01-26.
//  Copyright © 2023 CodingWithTom. All rights reserved.
//

import Foundation

protocol FeedItemVisitor {
  associatedtype Outcome
  associatedtype Data
  func visit(bannerItem: BannerItem, data: Data) -> Outcome
  func visit(storeItem: StoreItem, data: Data) -> Outcome
  func visit(featuredProductItem: FeaturedProductItem, data: Data) -> Outcome
  func visit(optionItem: OptionItem, data: Data) -> Outcome
}
