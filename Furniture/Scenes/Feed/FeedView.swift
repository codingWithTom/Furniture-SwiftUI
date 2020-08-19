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
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(showsIndicators: false) {
        VStack {
          ForEach(viewModel.getSections(), id: \.name) { section in
            section.accept(visitor: FeedSectionFactory(), data: (geometry: geometry, sizeClass: horizontalSizeClass ?? .compact))
          }
        }
      }
    }
  }
}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView(viewModel: FeedViewModel())
      .preferredColorScheme(.light)
  }
}
