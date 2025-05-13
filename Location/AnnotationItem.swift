//
//  AnnotationItem.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//


import SwiftUI
import MapKit
import CoreLocation


struct AnnotationItem: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let address: String?
    let phoneNumber: String?

    /// URL dinámica a una imagen de Unsplash buscando por el nombre de la sucursal
    var imageURL: URL? {
        let query = name
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? name
        let urlString = "https://source.unsplash.com/random/600x400/?Liverpool,\(query)"
        print("🔗 Generada URL de imagen:", urlString)   
        return URL(string: urlString)
    }

}
