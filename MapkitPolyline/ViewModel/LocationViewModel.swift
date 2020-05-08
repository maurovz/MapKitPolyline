import MapKit
import Polyline

class LocationViewModel: ObservableObject {
  var locations = [CLLocationCoordinate2D]()
  
  func load() {
    fetchLocations()
  }
  
  private func fetchLocations() {
    let polyline = Polyline(encodedPolyline: "_evtFpnlW{udr@i{se@rnti@gb|_A{ho`AgtcAfhbEpbtqA")
    guard let decodedLocations = polyline.locations else { return }
    locations = decodedLocations.map { CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)}
  }
}
