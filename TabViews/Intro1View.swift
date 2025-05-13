//
//  IntroView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct Intro1View: View {
    var body: some View {
        VStack(spacing: 24) {
            // Header
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.liverpoolPink, Color.liverpoolPink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(height: 180)
                .ignoresSafeArea()

                Text("¿Qué es Liverpool Here?")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            }

            // Description
            VStack(alignment: .leading, spacing: 16) {
                Text("Descubre tu experiencia de compra ideal")
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .foregroundColor(.liverpoolPink)

                Text("¿Te has sentido abrumado buscando productos en un mar de opciones? Liverpool Here simplifica tu experiencia filtrando tus intereses para ofrecerte recomendaciones personalizadas.")
                    .font(.system(size: 17, weight: .regular, design: .rounded))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)

                Text("Pasa unos rápidos pasos de preferencia y verificación. Obtén un servicio eficiente y personalizado en todas tus compras físicas y en línea.")
                    .font(.system(size: 17, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal)

            // Logo
            Image("LiverpoolHereLogoTest")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 220)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                .padding(.horizontal)

            
            Spacer()
            Text("Encuentra lo que amas, más rápido!")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.liverpoolPink)
                .padding(.bottom, 40)
        }
    }
}

// MARK: - Preview
struct Intro1View_Previews: PreviewProvider {
    static var previews: some View {
        Intro1View()
    }
}

