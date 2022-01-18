//
//  BannerCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct BannerCell: View {
  let banner: BannerItem
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(banner.title)
        .font(.headline)
      Text(banner.subtitle)
        .font(.subheadline)
      Image(banner.imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .accessibilityHidden(true)
    }
    .accessibilityElement(children: .combine)
  }
}

struct BannerCell_Previews: PreviewProvider {
  static var previews: some View {
    BannerCell(banner: BannerItem(title: "Banner title", subtitle: "BAnner subtitle", imageName: "Banner0"))
  }
}
