//
//  AnnotationDetailView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI
import MapKit
import Contacts

struct AnnotationDetailView: View {
    let annotation: AnnotationItem
    
    let LiverpoolPink = Color(
        red: 208.0 / 255.0,
        green: 51.0 / 255.0,
        blue: 152.0 / 255.0
    )
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // 1. Imagen de la sucursal
                if let url = annotation.imageURL {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(height: 200)
                                    .cornerRadius(12)
                                ProgressView()
                            }
                            
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, minHeight: 200)
                                .clipped()
                                .cornerRadius(12)
                            
                        case .failure(_):
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(height: 200)
                                    .cornerRadius(12)
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.gray)
                            }
                            
                        @unknown default:
                            EmptyView()
                        }
                    }
                }

                // 2. Datos textuales
                Text(annotation.name)
                    .font(.largeTitle)
                    .bold()

                if let address = annotation.address {
                    Label(address, systemImage: "mappin.and.ellipse")
                }

                if let phone = annotation.phoneNumber {
                    Label(phone, systemImage: "phone")
                }

                // 3. Botón para abrir en Apple Maps
                Button("Abrir en Apple Maps") {
                    openInAppleMaps(coordinate: annotation.coordinate, name: annotation.name)
                }
                .padding()
                .background(LiverpoolPink)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()
            }
            .padding()
        }
    }
    
    private func openInAppleMaps(coordinate: CLLocationCoordinate2D, name: String) {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: nil)
    }
}

struct AnnotationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationDetailView(annotation: AnnotationItem(
            name: "Liverpool Centro",
            coordinate: CLLocationCoordinate2D(latitude: 19.4326, longitude: -99.1332),
            address: "Av. Juárez 100, CDMX",
            phoneNumber: "55 1234 5678"
        ))
    }
}
