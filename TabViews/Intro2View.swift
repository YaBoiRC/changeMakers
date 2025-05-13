//
//  IntroView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct Intro2View: View {
    
    var body: some View {
        
        VStack(spacing:24)
        {
            
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.liverpoolPink, Color.liverpoolPink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(height: 180)
                .ignoresSafeArea()

                Text("Primeros pasos")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            }
            
            
                
            
            
            Text("¡Crea tu perfil de recomendaciones!")
                .multilineTextAlignment(.center)
                .font(.custom("AvenirNext-Bold", size: 20))
                .padding(.top, 20)
            
            
            Text("\n¡Tómate una selfie de tu rostro y automáticamente se importarán tus productos deseados de tu wishlist para personalizar tu experiencia!")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.70))
                .padding(.horizontal)
 
                .foregroundStyle(.black.opacity(0.65))
            
            
            
            Image("HappyMF")
                .resizable()
                .cornerRadius(25)
                .shadow(radius: 10, y: 3)
                .padding(.all, 20)
                .frame(width: 410, height: 280, alignment: .center)
            
            
            
        }.ignoresSafeArea()
        
    }
}

#Preview {
    Intro2View()
}
