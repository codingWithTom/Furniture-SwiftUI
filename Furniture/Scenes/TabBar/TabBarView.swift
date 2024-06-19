//
//  TabBarView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-28.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
  @State private var stores: [StoreItem] = []
  @AppStorage("FurnitureCustomization")
  private var customization: TabViewCustomization
  
  var body: some View {
    TabView {
      Tab("Feed", systemImage: "rectangle.3.offgrid.fill") {
        FeedView(viewModel: FeedViewModel())
      }
      .customizationBehavior(.disabled, for: .sidebar, .tabBar)
      
      Tab("Order", systemImage: "cart.fill") {
        OrderView(viewModel: OrderViewModel())
      }
      .customizationID("com.furniture.order")
      TabSection("Stores") {
        Tab("Map", systemImage: "map.fill") {
          StoresView(viewModel: StoresViewModel())
        }
        .customizationID("com.furniture.stores.map")
        .customizationBehavior(.reorderable, for: .sidebar, .tabBar)
        
        ForEach(stores, id: \.id) { storeItem in
          Tab(storeItem.title, systemImage: "storefront") {
            StoreItemView(storeItem: storeItem)
          }
          .customizationID(storeItem.id)
          .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button("Delete", systemImage: "trash.fill", role: .destructive) {
              guard let index = stores.firstIndex(where: { $0.id == storeItem.id }) else { return }
              stores.remove(at: index)
            }
          }
        }
        
      }
      .customizationID("com.furniture.stores")
      .dropDestination(for: StoreItem.self) { stores in
        self.stores.append(contentsOf: stores)
      }
      .sectionActions {
        Button("Remove All", systemImage: "eraser.fill", role: .destructive) {
          self.stores = []
        }
      }
    }
    .tabViewStyle(.sidebarAdaptable)
    .tabViewCustomization($customization)
  }
}

struct TabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView()
  }
}

import UniformTypeIdentifiers
extension UTType {
  static var storeItem: UTType {
    UTType(exportedAs: "com.furniture.storeItem")
  }
}

extension StoreItem: Transferable {
  static var transferRepresentation: some TransferRepresentation {
    DataRepresentation(contentType: .storeItem) { storeItem in
      try JSONEncoder().encode(storeItem)
    } importing: { data in
      try JSONDecoder().decode(StoreItem.self, from: data)
    }
    
    DataRepresentation(exportedContentType: .png) { storeItem in
      UIImage(named: storeItem.imageName)?.pngData() ?? Data()
    }
  }
}
