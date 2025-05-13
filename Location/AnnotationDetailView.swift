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
    
    var annotation: AnnotationItem
    
    var body: some View {
        VStack {
            Text(annotation.name)
                .font(.largeTitle)
            Button("Cerrar") {
            }
        }
        .padding()
    }
    

    
}

