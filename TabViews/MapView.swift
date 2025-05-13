//
//  MapView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//


import SwiftUI
import MapKit


struct MapView: View {
    @StateObject private var locationManager = CustomLocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var showFullMap = false
    @State private var initialRegionSet = false
    @State private var nearbyAnnotations: [AnnotationItem] = sampleAnnotations
    @State private var selectedAnnotation: AnnotationItem?
    @State private var isSheetPresented: Bool = false
    @State private var city: String = "Desconocida"
    @State private var tips: [String] = []
    @State var index = 3
    
    
    
    
    var body: some View {
        VStack{
            HeaderView(index: index, name: "Juanito", backArrow: false, sendDashboard: false)
            
            
            NavigationView {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        // Bienvenida
                        Text("Liverpool cerca de ti")
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                        
                        // Mapa
                        ZStack(alignment: .topTrailing) {
                            Map(coordinateRegion: $region,
                                showsUserLocation: true,
                                annotationItems: nearbyAnnotations) { item in
                                MapAnnotation(coordinate: item.coordinate) {
                                    VStack(spacing: 4) {
                                        Image(systemName: "mappin.circle.fill")
                                            .foregroundColor(.red)
                                            .font(.title)
                                            .shadow(radius: 3)
                                        Text(item.name)
                                            .font(.caption)
                                            .foregroundColor(.black)
                                            .padding(4)
                                            .background(Color.white.opacity(0.8))
                                            .cornerRadius(8)
                                    }
                                    .onTapGesture {
                                        openInAppleMaps(coordinate: item.coordinate, name: item.name)
                                    }
                                }
                            }
                                .frame(height: 330)
                                .cornerRadius(15)
                                .padding(.horizontal)
                                .shadow(radius: 5)
                                .onAppear {
                                    if let userLocation = locationManager.location?.coordinate, !initialRegionSet {
                                        region = MKCoordinateRegion(
                                            center: userLocation,
                                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                        )
                                        initialRegionSet = true
                                    }
                                }
                        }
                        
                    }
                    
                    
                }
            }
        }
    }
}

// Existing AnnotationItem and sampleAnnotations
struct AnnotationItem: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let sampleAnnotations: [AnnotationItem] = [
    // Example: AnnotationItem(name: "Parque Central", coordinate: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161))
]

// Funcion para poder abrir el Apple Maps
func openInAppleMaps(coordinate: CLLocationCoordinate2D, name: String) {
    let placemark = MKPlacemark(coordinate: coordinate)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = name
    mapItem.openInMaps()
}

#Preview {
    MapView()
}


