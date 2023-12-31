import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedTaxiLocation: TaxiLocation?
    @Published var selectedLocation : TaxiLocation?
    @Published var pickupTime: String?
    @Published var dropOfTime: String?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            print("DEBUG: Query fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userLocation: CLLocationCoordinate2D?
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
       locationSearch(forLocalSearchCompletion:localSearch)
        { response, error in
            if let error = error {
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedTaxiLocation = TaxiLocation (title: localSearch.title, coordinate: coordinate )
            print("DEBUG: Location coordinates \(coordinate)")
        }
    }
    func setLocation(location: TaxiLocation) {
        self.selectedTaxiLocation = location
    }
    func setSelectedLocation(location: TaxiLocation) {
        self.selectedLocation = location
    }
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
    }
    func computeRidePrice(forType type: RideType) -> Double {
        guard let destCoordinate = selectedTaxiLocation?.coordinate,
              let userCoordinate = self.userLocation else {
            // Handle the case where either coordinate is nil, e.g., return a default value or throw an error
            return type.computePrice(for: 0.0)  // Assuming a default distance of 0.0 in case of nil coordinates
        }
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: destCoordinate.latitude, longitude: destCoordinate.longitude)
        
        let tripDistanceInMeters = userLocation.distance(from: destination)
        return type.computePrice(for: tripDistanceInMeters)
    }
    func getDestinationRoute(from userLocation: CLLocationCoordinate2D,
                             
                             to destination: CLLocationCoordinate2D, completion:
                             @escaping(MKRoute) -> Void ){
        let userPlacemark = MKPlacemark (coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let directions = MKDirections(request: request)
        
        directions.calculate {response, error in
            if let error = error {
                print("DEBUG: Failed to get directions with error \(error.localizedDescription)")
                return
            }
            guard let route = response?.routes.first else {return}
            self.configurePickuoAndDroppffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    func configurePickuoAndDroppffTimes(with expectedTravelTime: Double){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:m a"
        pickupTime = formatter.string(from: Date())
        dropOfTime = formatter.string(from:  Date() + expectedTravelTime)
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
