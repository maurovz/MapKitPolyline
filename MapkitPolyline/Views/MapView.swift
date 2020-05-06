import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  private let routeViewModel = RouteViewModel()
  private let mapZoomEdgeInsets = UIEdgeInsets(top: 30.0, left: 30.0, bottom: 30.0, right: 30.0)
  
  init() {
    routeViewModel.load()
  }
  
  func makeCoordinator() -> MapViewCoordinator {
    MapViewCoordinator(self)
  }
  
  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.showsUserLocation = true
    mapView.delegate = context.coordinator
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    updateAnnotations(from: uiView)
  }
  
  func updateAnnotations(from mapView: MKMapView) {
    let annotations = routeViewModel.makeStopAnnotations()
    mapView.removeOverlays(mapView.overlays)
    let polyline = MKPolyline(coordinates: annotations, count: annotations.count)
    mapView.addOverlay(polyline)
    setMapZoomArea(map: mapView, polyline: polyline, edgeInsets: mapZoomEdgeInsets, animated: true)
  }
  
  private func setMapZoomArea(map: MKMapView, polyline: MKPolyline, edgeInsets: UIEdgeInsets, animated: Bool = false) {
      map.setVisibleMapRect(polyline.boundingMapRect, edgePadding: edgeInsets, animated: animated)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
