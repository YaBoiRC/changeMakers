//
//  NearbyMapView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI
import MapKit

struct NearbyMapView: View {
    @ObservedObject var viewModel: RegionViewModel
    @Binding var showFullMap: Bool

    let annotations: [AnnotationItem]
    let onTap: (AnnotationItem) -> Void
    let onRefresh: () -> Void
    @State private var nearbyAnnotations: [AnnotationItem] = []

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
            .frame(height: 330)
            .cornerRadius(15)
            .padding(.horizontal)
            .shadow(radius: 5)

            Button {
                showFullMap = true
            } label: {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    .font(.title).padding(8)
                    .background(.white.opacity(0.8))
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .padding(.trailing, 30)
            .padding(.top, 10)
        }
    }
    
    func fetchNearby(at coord: CLLocationCoordinate2D) {
        showNearby(category: "Liverpool", at: coord) { results in
            nearbyAnnotations = results
        }
    }

}

