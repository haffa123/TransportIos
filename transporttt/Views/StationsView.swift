import SwiftUI
import MapKit

struct Station: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct StationsView: View {
    @State private var stations: [Station] = [
        Station(name: "Station A", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        Station(name: "Station B", coordinate: CLLocationCoordinate2D(latitude: 37.7742, longitude: -122.4324)),
        // Add more stations as needed
    ]

    @State private var selectedStation: Station?

    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )), showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: stations) { station in
                MapPin(coordinate: station.coordinate, tint: .blue)
            }
            .onTapGesture {
                // Handle taps on the map (not on markers) here
            }

            ForEach(stations) { station in
                Button(action: {
                    selectedStation = station
                }, label: {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.clear)
                })
                .position(
                    x: UIScreen.main.bounds.size.width * CGFloat(station.coordinate.longitude + 180) / 360.0,
                    y: UIScreen.main.bounds.size.height * (0.5 - CGFloat(log(tan(.pi / 4 + station.coordinate.latitude * .pi / 360.0 / 2.0)) / .pi)) / 2.0
                )
            }
        }
        .alert(item: $selectedStation) { station in
            Alert(
                title: Text(station.name),
                message: Text("Latitude: \(station.coordinate.latitude)\nLongitude: \(station.coordinate.longitude)"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct StationsView_Previews: PreviewProvider {
    static var previews: some View {
        StationsView()
    }
}
