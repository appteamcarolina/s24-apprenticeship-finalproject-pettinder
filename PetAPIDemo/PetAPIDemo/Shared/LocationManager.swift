import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private var manager = CLLocationManager()
    @Published var hasLocationAccess: Bool = false
    @Published var postalCode: String?

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }

    func requestLocation() {
        if (hasLocationAccess) {
            manager.requestLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    print("Reverse geocoding error: \(error.localizedDescription)")
                    return
                }

                if let placemark = placemarks?.first {
                    self.postalCode = placemark.postalCode
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            hasLocationAccess = false
        case .restricted:
            hasLocationAccess = false
        case .denied:
            hasLocationAccess = false
        case .authorizedAlways:
            hasLocationAccess = true
        case .authorizedWhenInUse:
            hasLocationAccess = true
        case .authorized:
            hasLocationAccess = true
        @unknown default:
            print("Unknown locationAuthorization state")
            hasLocationAccess = false
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}
