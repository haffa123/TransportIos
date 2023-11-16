import SwiftUI
import MapKit

struct Cordinates : Codable {
    let lan: Double
    let lat : Double
}

struct Station: Identifiable, Hashable, Equatable, Decodable {
    let id = UUID()
    let title: String
    let coordinates: Cordinates
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: Station, rhs: Station) -> Bool {
            return lhs.id == rhs.id
        }
}

struct TripModel: Identifiable {
    let id = UUID()
    let date: Date
    var startStation: Station
    let endStation: Station
 
}

struct fetchStationsResponse : Decodable  {
    let stations : [Station]
    let message : String
    let statusCode : Int
}

struct StationsView: View {

    @State private var selectedStation: Station?
    @StateObject var stationViewModel : StationViewModel
    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )), showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: stationViewModel.stations) { station in
                MapPin(coordinate: CLLocationCoordinate2D(latitude:station.coordinates.lat , longitude: station.coordinates.lan), tint: .blue)
            }.onAppear {
                stationViewModel.fetchStations()
            }
            .onTapGesture {
                // Handle taps on the map (not on markers) here
            }

            
        }
    }
}

struct StationsView_Previews: PreviewProvider {
    static var previews: some View {
        StationsView(stationViewModel: StationViewModel())
    }
}
