//
//  FeedSectionVisitor.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

protocol FeedSectionVisitor {
  associatedtype Outcome
  associatedtype Data
  func visit(bannerSection: BannerSection, data: Data) -> Outcome
  func visit(storeSection: StoreSection, data: Data) -> Outcome
  func visit(featuredProductSection: FeaturedProductSection, data: Data) -> Outcome
  func visit(optionSection: OptionSection, data: Data) -> Outcome
}
