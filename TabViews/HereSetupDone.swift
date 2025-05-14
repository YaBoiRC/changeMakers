//
//  IntroSwipeView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct HereSetupDone: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.liverpoolPink)
                    .padding(.top, 40)

                Text("¡Tu configuración está lista!")
                    .font(.title2.bold())
                    .foregroundColor(.primary)

                Text("Desliza hacia abajo para ir a la aplicación principal.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                Spacer()
            }
            .padding()
            .frame(maxWidth: 400, maxHeight: 400) // Establece un tamaño cuadrado fijo
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.9), Color.blue.opacity(0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(radius: 10).padding(.horizontal)
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Acción para regresar
                    }) {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top).padding(.horizontal)
    }
}

#Preview {
    HereSetupDone()
}

