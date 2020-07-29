//
//  StoresMapView.swift
//  Furniture
//
//  Created by Tomas Trujillo on 2020-07-28.
//  Copyright © 2020 CodingWithTom. All rights reserved.
//

import SwiftUI
import MapKit

final class StoreAnnotationViewModel: NSObject {
  let latitude: Double
  let longitude: Double
  let name: String
  let address: String
  let isOpen: Bool
  
  init(latitude: Double, longitude: Double, name: String, address: String, isOpen: Bool) {
    self.latitude = latitude
    self.longitude = longitude
    self.name = name
    self.address = address
    self.isOpen = isOpen
    super.init()
  }
}

extension StoreAnnotationViewModel: MKAnnotation {
  var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

struct StoresMapView: UIViewRepresentable {
  let annotations: [StoreAnnotationViewModel]
  let calloutTapped: (StoreAnnotationViewModel) -> Void
  
  func makeCoordinator() -> StoresMapViewCoordinator {
    return StoresMapViewCoordinator(calloutTapped: calloutTapped)
  }
  
  func makeUIView(context: Context) -> MKMapView {
    let map = MKMapView()
    let center = CLLocationCoordinate2D(latitude: 37.7890292, longitude: -122.4124627)
    map.setCamera(MKMapCamera(lookingAtCenter: center,
                              fromEyeCoordinate: center,
                              eyeAltitude: 2000),
                  animated: true)
    map.delegate = context.coordinator
    return map
  }
  
  func updateUIView(_ mapView: MKMapView, context: Context) {
    mapView.addAnnotations(annotations)
  }
}

final class StoresMapViewCoordinator: NSObject, MKMapViewDelegate {
  let calloutTapped: (StoreAnnotationViewModel) -> Void
  
  init(calloutTapped: @escaping (StoreAnnotationViewModel) -> Void) {
    self.calloutTapped = calloutTapped
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard let storeAnnotation = annotation as? StoreAnnotationViewModel else { return MKPinAnnotationView() }
    let marker = MKMarkerAnnotationView()
    marker.markerTintColor = storeAnnotation.isOpen ? .blue : .gray
    marker.canShowCallout = true
    let calloutButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
    calloutButton.setImage(UIImage(systemName: storeAnnotation.isOpen ? "phone.fill.arrow.up.right" : "questionmark.circle"), for: .normal)
    marker.rightCalloutAccessoryView = calloutButton
    let nameLabel = UILabel()
    nameLabel.text = storeAnnotation.name
    marker.detailCalloutAccessoryView = nameLabel
    return marker
  }
  
  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    guard let storeAnnotation = view.annotation as? StoreAnnotationViewModel else { return }
    calloutTapped(storeAnnotation)
  }
}

