//
//  LiverpoolMapView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct LiverpoolMapView: UIViewRepresentable {
    @StateObject private var vm = LiverpoolMapViewModel()

    func makeCoordinator() -> Coordinator {
        Coordinator(vm: vm)
    }

    func makeUIView(context: Context) -> MKMapView {
        let map = vm.mapView
        map.delegate = context.coordinator          // Delegate en el coordinator
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Si vm.region cambia, centrar aquí:
        if let region = vm.region {
            uiView.setRegion(region, animated: true)
        }
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        private let vm: LiverpoolMapViewModel
        init(vm: LiverpoolMapViewModel) {
            self.vm = vm
        }

        // Redirigir llamada al VM
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            vm.mapView(mapView, viewFor: annotation)
        }
    }
}
