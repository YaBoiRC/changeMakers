//
//  BannerServiceView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//


import SwiftUI

struct BannerServiceView<Destination: View>: View {
    var text: String
    var destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image("LiverpoolHereLogoTest")
                Text(text)
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: 350)
            .background(Color.liverpoolPink)
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle()) // Elimina el estilo predeterminado del botón
    }
}
