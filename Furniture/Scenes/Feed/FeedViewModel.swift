//
//  FeedViewModel.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import Foundation

final class FeedViewModel {
  struct Dependencies {
    var storeService: StoreService = StoreServiceAdapter.shared
  }
  let dependencies: Dependencies
  
  private lazy var sections: [FeedSection] = {
    let stores = self.dependencies.storeService.getStores()
    return [
      BannerSection(name: nil, items: [
        BannerItem(title: "Build awesome living rooms", subtitle: "Book an appointment with our experts now!", imageName: "Banner0"),
        BannerItem(title: "A design for everybody", subtitle: "Your expectations will be met", imageName: "Banner1"),
        BannerItem(title: "Professional work place", subtitle: "Want to mount an office, count us in!", imageName: "Banner2"),
        BannerItem(title: "Build your own experience", subtitle: "Hard-working, relaxing, open, private, you name it!", imageName: "Banner3"),
        BannerItem(title: "Rugs or hardwood floor", subtitle: "Whatever surface you want we have it", imageName: "Banner4"),
      ]),
      StoreSection(name: "Our Best Stores", items: stores.map { StoreItem(title: $0.name, subtitle: $0.address, imageName: $0.imageName) }),
      FeaturedProductSection(name: "Featured Products", items: [
        FeaturedProductItem(title: "Dinning Room", subtitle: "Stunning dining table and chairs", imageName: "diningRoom"),
        FeaturedProductItem(title: "Kitchen Tools", subtitle: "Must-have set of kitchen tools", imageName: "kitchenTools"),
        FeaturedProductItem(title: "Living Room", subtitle: "Everything you need for a living room, no matter the place!", imageName: "livingRoom"),
        FeaturedProductItem(title: "Moving Tools", subtitle: "Make sure to buy these before moving to your new home!", imageName: "movingTools"),
        FeaturedProductItem(title: "Power Drill", subtitle: "Save yourself a lot of effort", imageName: "powerDrill"),
        FeaturedProductItem(title: "Table decorations", subtitle: "Perfect for the center of the table", imageName: "tableDecoration"),
        FeaturedProductItem(title: "Tool box", subtitle: "For every do-it-yourself person", imageName: "toolBox"),
        FeaturedProductItem(title: "Wicker furniture", subtitle: "Wicker is what your patio needs", imageName: "wicker")
      ]),
      OptionSection(name: "Quick Links", items: [
        OptionItem(title: "About Funiture Aeki", systemImageName: "info"),
        OptionItem(title: "Share Aeki with your friends", systemImageName: "square.and.arrow.up.fill"),
        OptionItem(title: "News", systemImageName: "book.circle"),
        OptionItem(title: "Privacy Policy", systemImageName: "lock.icloud"),
        OptionItem(title: "Contact Us", systemImageName: "person.crop.circle.fill")
      ])
    ]
  }()
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func getSections() -> [FeedSection] {
    return sections
  }
}
