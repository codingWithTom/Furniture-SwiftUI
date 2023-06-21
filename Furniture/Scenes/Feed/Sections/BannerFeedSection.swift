//
//  BannerFeedSection.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct BannerFeedSection: View {
  @Environment(\.horizontalSizeClass) private var horizontalSizeClass
  let section: BannerSection
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack(alignment: .leading) {
        Text(section.name ?? "")
          .font(.title)
          .accessibilityAddTraits(.isHeader)
        HStack {
          ForEach(section.items, id: \.id) { bannerItem in
            NavigationLink(value: bannerItem) {
              BannerCell(banner: bannerItem)
                .containerRelativeFrame(.horizontal, count: horizontalSizeClass == .regular ? 3 : 1, spacing: 8)
                .scrollTransition(axis: .horizontal) { content, phase in
                  content.scaleEffect(phase == .identity ? CGSize(width: 1.0, height: 1.0) : .zero)
                }
            }
          }
        }
        .scrollTargetLayout()
      }
    }
    .scrollTargetBehavior(.viewAligned)
    .contentMargins(.horizontal, 20, for: .scrollContent)
  }
}

struct BannerFeedSection_Previews: PreviewProvider {
  static var previews: some View {
    BannerFeedSection(
      section: BannerSection(
        name: nil,
        items: [
          BannerItem(title: "Build awesome living rooms", subtitle: "Book an appointment with our experts now!", imageName: "Banner0"),
          BannerItem(title: "A design for everybody", subtitle: "Your expectations will be met", imageName: "Banner1"),
          BannerItem(title: "Professional work place", subtitle: "Want to mount an office, count us in!", imageName: "Banner2"),
          BannerItem(title: "Build your own experience", subtitle: "Hard-working, relaxing, open, private, you name it!", imageName: "Banner3"),
          BannerItem(title: "Rugs or hardwood floor", subtitle: "Whatever surface you want we have it", imageName: "Banner4")
        ])
    )
    .preferredColorScheme(.dark)
  }
}
