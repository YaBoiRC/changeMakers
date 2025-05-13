//
//  IntroView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct Intro2View: View {
    
    let LiverpoolPink = Color(
        red:   208.0/255.0,
        green:  51.0/255.0,
        blue:  152.0/255.0
    )
    
    var body: some View {
        
        VStack
        {
            
            Text("Primeros pasos:")
                .padding(.vertical, 40)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LiverpoolPink)
                .ignoresSafeArea(.all)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .offset(y: -53.1)
                //.shadow(radius: 10, y: 1)
            
            
                
            
            
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
    HomeView()
}
