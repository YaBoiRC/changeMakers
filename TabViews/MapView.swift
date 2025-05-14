//
//  MapView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI
import MapKit
import UserNotifications

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
                            .font(.title).bold().padding(.top).padding(.bottom, 5).foregroundStyle(Color.liverpoolPink)
                        
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
                    guard let loc = loc else { return }
                    print("Ubicacion: \(loc.coordinate.latitude), \(loc.coordinate.longitude)")
                    fetchNearby(at: loc.coordinate)
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                        if let error = error {
                            print("Error de permisos: \(error.localizedDescription)")
                        }
                    }
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
                onClose: { showFullMap = false },
                onTap: { _ in },
                onRefresh: {}
            )
        }
        
        
    }
    
    // PARA HACER QUE EL GPS SE MUEVE Y VER LOS NOTIFICACIONES VAS A IR A LO SIG:
    // Product > Scheme > Edit Scheme > Default Location > Location.gpx > Corre el programa y sal del app durante la seccion de Mapa
    
    private func fetchNearby(at coord: CLLocationCoordinate2D) {
        showNearby(category: "Liverpool", at: coord) { results in
            nearbyAnnotations = results
            
            var wasInside = false
            for item in results {
                let distance = item.coordinate.distance(from: coord)
                let isInside = distance < 1000

                if isInside && !wasInside {
                    print("Ha entrado del rango \(item.name)")
                } else if !isInside && wasInside {
                    print("Ha salido del rango \(item.name)")
                }

                wasInside = isInside
            }
            
            if let nearby = results.first(where: {
                $0.coordinate.distance(from: coord) < 1000
            }) {
                sendIncentiveNotification(for: nearby)
            }
        }
    }
}

private func sendIncentiveNotification(for item: AnnotationItem) {
    let content = UNMutableNotificationContent()
    content.title = "¡Hay una sucursal cerca de ti!"
    content.body = "Visita la sucursal \(item.name) y compra lo que necesitas!"
    content.sound = .default

    if let imageURL = Bundle.main.url(forResource: "shoppingBags", withExtension: "png") {
        do {
            let attachment = try UNNotificationAttachment(identifier: "image", url: imageURL, options: nil)
            content.attachments = [attachment]
        } catch {
            print("Error attaching image: \(error.localizedDescription)")
        }
    } else {
        print("liverpoolLogo.png not found in bundle — proceeding without image.")
    }

    let request = UNNotificationRequest(
        identifier: UUID().uuidString,
        content: content,
        trigger: UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
    )

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Falla de la notificación: \(error.localizedDescription)")
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
