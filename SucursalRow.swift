//
//  SucursalRow.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct SucursalRow: View {
    let item: AnnotationItem
    let onDetail: (AnnotationItem) -> Void
    
    let LiverpoolPink = Color(
        red:   208.0/255.0,
        green:  51.0/255.0,
        blue:  152.0/255.0
    )

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.name)
                .font(.subheadline)
                .bold()
            if let address = item.address {
                Text(address)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            if let phone = item.phoneNumber {
                Text("Teléfono: \(phone)")
                    .font(.footnote)
            }
            Button("Detalle") {
                onDetail(item)
            }
            .font(.footnote)
            .padding(.vertical, 4)
            .padding(.horizontal, 12)
            .background(LiverpoolPink)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 1)
        .padding(.horizontal)
    }
}
