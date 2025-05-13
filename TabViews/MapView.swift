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
    
    
    
    // El mensaje de bienvenida dependiendo del tiempo del dia
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return "Buenos días ☀️"
        case 12..<20:
            return "Buenas tardes 🌇"
        default:
            return "Buenas noches 🌙"
        }
    }
    
    // Fecha formateada para el inicio
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: Date()).capitalized
    }
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    // Bienvenida
                    Text(greeting)
                        .font(.title)
                        .bold()
                        .padding(.top).padding(.horizontal)
                    
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
                    
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Text("Hoy")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 30)
                                    .padding(.bottom, 10)
                                Text(formattedDate)
                                    .font(.subheadline)
                                    .foregroundColor(Color.primary.opacity(0.6))
                                    .bold()
                                    .padding(.vertical, 30)
                                    .padding(.top, 5)
                                    .padding(.bottom, 10)
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
