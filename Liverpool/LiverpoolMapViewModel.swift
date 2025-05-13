//
//  File.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

/*
import Foundation
import SwiftUI
import MapKit
import CoreLocation

/// ViewModel que expone región y ejecuta búsqueda de “Liverpool”
class LiverpoolMapViewModel: NSObject, ObservableObject {
    @Published var mapView = MKMapView()
    @Published var region: MKCoordinateRegion?

    private let locationManager = CLLocationManager()

    override init() {
        super.init()

        // CLLocationManager setup
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        // MKMapView setup
        mapView.showsUserLocation = true
        mapView.delegate = self
    }

    /// Ejecutar búsqueda de “Liverpool” cerca de `location`
    private func searchNearbyLiverpool(at location: CLLocation) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Liverpool"
        request.region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: 5_000,
            longitudinalMeters: 5_000
        )

        MKLocalSearch(request: request).start { response, error in
            guard let items = response?.mapItems else { return }
            DispatchQueue.main.async {
                self.addAnnotations(from: items)
            }
        }
    }

    /// Añade anotaciones rosadas
    private func addAnnotations(from items: [MKMapItem]) {
        let annotations = items.map { item -> MKPointAnnotation in
            let anno = MKPointAnnotation()
            anno.coordinate = item.placemark.coordinate
            anno.title = item.name
            return anno
        }
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }
}

// MARK: - CLLocationManagerDelegate

extension LiverpoolMapViewModel: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let loc = locations.last else { return }

        // Ajustar región de la vista al usuario
        let newRegion = MKCoordinateRegion(
            center: loc.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        )

        // Move the MKMapView and publish region
        DispatchQueue.main.async {
            self.mapView.setRegion(newRegion, animated: true)
            self.region = newRegion
        }

        // Buscar Liverpool cercanos
        searchNearbyLiverpool(at: loc)
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Error al obtener ubicación: \(error.localizedDescription)")
    }
}

// MARK: - MKMapViewDelegate

extension LiverpoolMapViewModel: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        // No custom view for user location “blue dot”
        if annotation is MKUserLocation { return nil }

        let id = "liverpoolPin"
        let marker = mapView.dequeueReusableAnnotationView(
            withIdentifier: id
        ) as? MKMarkerAnnotationView
            ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: id)

        // Official Liverpool pink/red
        marker.markerTintColor = UIColor(red: 227/255, green: 6/255, blue: 19/255, alpha: 1)
        marker.glyphImage = UIImage(systemName: "bag.fill")
        marker.canShowCallout = true
        return marker
    }
}

extension LiverpoolMapViewModel {
    /// Expose a way for the View to kick off location permission & updates.
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
*/
