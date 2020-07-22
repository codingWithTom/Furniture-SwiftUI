//
//  AddProductView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-22.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI

struct AddProductView: View {
  @Binding var isPresenting: Bool
  let viewModel: AddProductViewModel
  var rows: [RowViewModel] {
    return viewModel.getRows()
  }
  
  var body: some View {
    NavigationView {
      GeometryReader { geometry in
        ScrollView {
            VStack {
              ForEach(self.rows) { row in
                HStack {
                  ForEach(row.products) { product in
                    ProductCell(name: product.name,
                                imageName: product.imageName,
                                imageSize: geometry.size.width / CGFloat(self.viewModel.getNumberOfProductsPerRow()) * 0.9)
                      .onTapGesture {
                        self.viewModel.add(product: product)
                        withAnimation {
                          self.isPresenting.toggle()
                        }
                    }
                  }
                }
              }
            }
          }
      }
      .navigationBarTitle("Add Product")
      .navigationBarItems(leading: Button(action: { self.isPresenting.toggle() }) {
        Text("Cancel")
      })
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ProductCell: View {
  let name: String
  let imageName: String
  let imageSize: CGFloat
  
  var body: some View {
    VStack {
      Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: imageSize, height: imageSize)
        .cornerRadius(8.0)
      Text(name)
    }
  }
}

struct AddProductView_Previews: PreviewProvider {
  static var previews: some View {
    AddProductView(isPresenting: .constant(true),
                   viewModel: AddProductViewModel())
  }
}
