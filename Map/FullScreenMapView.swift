//
//  FullScreenMapView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import MapKit
import SwiftUI


struct FullScreenMapView: View {
    @ObservedObject var viewModel: RegionViewModel
    let annotations: [AnnotationItem]
    let onClose: () -> Void
    @State private var nearbyAnnotations: [AnnotationItem] = []

    @StateObject private var locationManager = CustomLocationManager()
    @StateObject private var regionVM = RegionViewModel(
        initial: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    )
    @State private var initialRegionSet = false
    @State private var selectedAnnotation: AnnotationItem?
    @State private var isSheetPresented = false
    @State private var showFullMap = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(
                coordinateRegion: $viewModel.region,
                interactionModes: .all,
                showsUserLocation: true,
                annotationItems: annotations
            ) { item in
                MapAnnotation(coordinate: item.coordinate) {
                    AnnotationView(item: item)
                        .onTapGesture { openInAppleMaps(item: item) }
                }
            }
            .ignoresSafeArea()

            Button(action: onClose) {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle).padding()
                    .background(.white.opacity(0.7)).clipShape(Circle())
            }
            .padding()
            .onReceive(locationManager.$location) { loc in
                guard let loc = loc, !initialRegionSet else { return }
                regionVM.region.center = loc.coordinate
                initialRegionSet = true
                fetchNearby(at: loc.coordinate)}
        }
        
    }
    func fetchNearby(at coord: CLLocationCoordinate2D) {
        showNearby(category: "Liverpool", at: coord) { results in
            nearbyAnnotations = results
        }
    }
}
