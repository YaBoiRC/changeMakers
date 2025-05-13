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
    @StateObject private var regionVM = RegionViewModel(
        initial: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    )
    @State private var initialRegionSet = false
    @State private var nearbyAnnotations: [AnnotationItem] = []
    @State private var selectedAnnotation: AnnotationItem?
    @State private var isSheetPresented = false
    @State private var showFullMap = false

    var body: some View {
        VStack {
            MapHeader()

            NavigationView {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        Text("Liverpool cerca de ti")
                            .font(.title).bold().padding(.horizontal)

                        NearbyMapView(
                            viewModel: regionVM,
                            showFullMap: $showFullMap,
                            annotations: nearbyAnnotations,
                            onTap: openInAppleMaps, // Esto está bien si openInAppleMaps recibe un AnnotationItem
                            onRefresh: {
                                if let coord = locationManager.location?.coordinate {
                                    fetchNearby(at: coord)
                                }
                            }
                        )


                        if !nearbyAnnotations.isEmpty {
                            Text("Sucursales cercanas")
                                .font(.headline).padding(.horizontal)
                            ForEach(nearbyAnnotations) { item in
                                SucursalRow(item: item) { sel in
                                    selectedAnnotation = sel
                                    isSheetPresented = true
                                }
                            }
                        }
                    }
                }
                .onReceive(locationManager.$location) { loc in
                    guard let loc = loc, !initialRegionSet else { return }
                    regionVM.region.center = loc.coordinate
                    initialRegionSet = true
                    fetchNearby(at: loc.coordinate)
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            if let selected = selectedAnnotation {
                AnnotationDetailView(annotation: selected)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
        .fullScreenCover(isPresented: $showFullMap) {
            FullScreenMapView(
                viewModel: regionVM,
                annotations: nearbyAnnotations,
                onClose: { showFullMap = false }
            )
            
        }
    }

    private func fetchNearby(at coord: CLLocationCoordinate2D) {
        showNearby(category: "Liverpool", at: coord) { results in
            nearbyAnnotations = results
        }
    }

    
}

// Componente HeaderView
struct MapHeader: View {
    
    var body: some View{
        ZStack {
            VStack {
                HStack(spacing: 12) {
                    Spacer()
                    Text("Mapa")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top)

                Spacer(minLength: 0)
            }
        }
        .background(Color.liverpoolPink)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 12)
    }
}

func openInAppleMaps(item: AnnotationItem) {
    let placemark = MKPlacemark(coordinate: item.coordinate)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = item.name
    mapItem.openInMaps()
}

#Preview {
    MapView()
}


