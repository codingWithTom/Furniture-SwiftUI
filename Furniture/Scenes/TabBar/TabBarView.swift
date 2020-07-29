//
//  TabBarView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-28.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
  
  var body: some View {
    TabView {
      OrderView(viewModel: OrderViewModel())
        .tabItem {
          Image(systemName: "cart.fill")
          Text("Order")
      }
      StoresView(viewModel: StoresViewModel())
        .tabItem {
          Image(systemName: "map.fill")
          Text("Stores")
      }
    }
  }
}

struct TabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView()
  }
}
