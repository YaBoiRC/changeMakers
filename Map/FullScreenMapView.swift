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
    @State private var initialRegionSet = false

    @StateObject private var locationManager = CustomLocationManager()

    let onTap: (AnnotationItem) -> Void
    let onRefresh: () -> Void

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
                        .onTapGesture { onTap(item) }
                }
            }
            .ignoresSafeArea()

            // Botón de cerrar
            Button(action: onClose) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.gray)
                    .padding(12)
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .padding(.top, 50)
            .padding(.trailing, 16)
        }
        .onReceive(locationManager.$location) { loc in
            guard let loc = loc, !initialRegionSet else { return }
            viewModel.region.center = loc.coordinate
            initialRegionSet = true
            fetchNearby(at: loc.coordinate)
        }
    }

    func fetchNearby(at coord: CLLocationCoordinate2D) {
        showNearby(category: "Liverpool", at: coord) { results in
            nearbyAnnotations = results
        }
    }
}
