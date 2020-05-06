import Foundation
import MapKit

class RouteViewModel: ObservableObject {
  @Published var stopViewModel = [StopViewModel]()
  
  func load() {
    fetchRoutes()
  }
  
  private func fetchRoutes() {
    let stops = [Stop(latitude: 41.9028, longitude: 12.4964),
                 Stop(latitude: 48.805911, longitude: 2.376859),
                 Stop(latitude: 51.1657, longitude: 10.4515),
                 Stop(latitude: 51.5074, longitude: 0.1278)]
    stopViewModel = stops.map(StopViewModel.init)
  }
  
  func makeStopAnnotations() -> [CLLocationCoordinate2D] {
    let annotations = stopViewModel.map({ (stop) -> CLLocationCoordinate2D in
      return CLLocationCoordinate2D(latitude: stop.latitude, longitude: stop.longitude)
    })
    return annotations
  }
}

class StopViewModel: ObservableObject {
  let stop: Stop
  
  init(stop: Stop) {
    self.stop = stop
  }
  
  var latitude: Double {
    return stop.latitude
  }
  
  var longitude: Double {
    return stop.longitude
  }
}
