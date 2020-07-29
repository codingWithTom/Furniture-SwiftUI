//
//  StoresView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-28.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct StoresView: View {
  
  let viewModel: StoresViewModel
  
  var body: some View {
    StoresMapView(annotations: viewModel.getStores()) { annotation in
      self.viewModel.tapped(annotation: annotation)
    }
  }
}

struct StoresView_Previews: PreviewProvider {
  static var previews: some View {
    StoresView(viewModel: StoresViewModel())
  }
}
