//
//  IntroView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//
import SwiftUI

struct Intro1View: View {
    
    var body: some View {
        
        VStack
        {
            
            Text("¿Qué es Liverpool Here?")
                .padding(.vertical, 40)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.liverpoolPink)
                .ignoresSafeArea(.all)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .offset(y: -27.9)
            //.shadow(radius: 10, y: 1)
            
            Text("¿Te has sentido abrumado buscando productos en un mar de opciones?")
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.leading)
                .padding(.top, 20).foregroundStyle(Color.liverpoolPink).padding(.horizontal)
            
            Text("\nLiverpool Here simplifica tu experiencia filtrando tus intereses para ofrecerte recomendaciones personalizadas.")
                .font(.system(size: 17, weight: .regular, design: .rounded))
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading).padding(.horizontal)
            
            
            Text("\nPasa unos rápidos pasos de preferencia y verificación. Obtén un servicio eficiente y personalizado en todas tus compras físicas y en línea.")
                .font(.system(size: 16, weight: .regular, design: .rounded))
                                    .foregroundColor(.black.opacity(0.7))
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
            
            
            
            
            Image("LiverpoolHereLogoTest")
                .resizable()
                .cornerRadius(25)
                .shadow(radius: 10, y: 3)
                .frame(width: 370, height: 220, alignment: .center)
            
            
            
            //.resizable()
            
            Text("¡Encuentra lo que amas, más rápido!")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                                .foregroundColor(.liverpoolPink)
                                .padding(.bottom, 40)
            
            
            
            
            
        }.ignoresSafeArea()
        
    }
    
    
}

#Preview {
    Intro1View()
}
