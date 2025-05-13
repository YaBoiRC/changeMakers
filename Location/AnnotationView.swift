//
//  AnnotationView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct AnnotationView: View {
    let item: AnnotationItem
    
    let LiverpoolPink = Color(
        red:   208.0/255.0,
        green:  51.0/255.0,
        blue:  152.0/255.0
    )

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "mappin.circle.fill")
                .foregroundColor(LiverpoolPink).opacity(0.9)
                .font(.title)
                .shadow(radius: 3)
            Text(item.name)
                .font(.caption)
                .foregroundColor(.black)
                .padding(4)
                .background(Color.white.opacity(0.8))
                .cornerRadius(8)
        }
    }
}

