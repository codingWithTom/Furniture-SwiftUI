//
//  OptionCell.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-08-17.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct OptionCell: View {
  let option: OptionItem
  var body: some View {
    HStack {
      Image(systemName: option.systemImageName)
        .foregroundColor(.blue)
      Text(option.title)
        .font(.title2)
    }
    .padding(.horizontal)
  }
}

struct OptionCell_Previews: PreviewProvider {
  static var previews: some View {
    OptionCell(option: OptionItem(title: "About Furniture Aeki", systemImageName: "info"))
  }
}
