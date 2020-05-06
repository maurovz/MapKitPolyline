import Foundation
import MapKit
import Polyline

class RouteViewModel: ObservableObject {
  var routeLocations = [CLLocationCoordinate2D]()
  
  func load() {
    fetchRoute()
  }
  
  private func fetchRoute() {
    let polyline = Polyline(encodedPolyline: "_evtFpnlW{udr@i{se@rnti@gb|_A{ho`AgtcAfhbEpbtqA")
    guard let decodedLocations = polyline.locations else { return }
    routeLocations = decodedLocations.map { CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)}
  }
}
