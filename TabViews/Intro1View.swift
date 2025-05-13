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
            
            Text("¿Que es Liverpool Here?")
                .padding(.vertical, 40)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.liverpoolPink)
                .ignoresSafeArea(.all)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .offset(y: -27.9)
            //.shadow(radius: 10, y: 1)
            
            Text("¿Has pensado que es dificil encontrar lo que quieres en un mar de productos?")
                .font(.custom("AvenirNext-Bold", size: 20))
                .multilineTextAlignment(.leading)
                .padding(.top, 20).foregroundStyle(Color.liverpoolPink).padding(.horizontal)
            
            
            Text("\n¡Pasa unos cortos checks de preferencias y verificacion para tener un servicio personalizado y eficiente en todas tus compras fisicas!")
                .font(.system(size: 17, weight: .regular, design: .rounded))
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading).padding(.horizontal)
            
            
            
            
            Image("LiverpoolHereLogoTest")
                .resizable()
                .cornerRadius(25)
                .shadow(radius: 10, y: 3)
                .frame(width: 370, height: 220, alignment: .center)
            
            
            
            //.resizable()
            
            Text("Encuentra lo que amas, mas rapido!")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                                .foregroundColor(.liverpoolPink)
                                .padding(.bottom, 40)
            
            
            
            
            
        }.ignoresSafeArea()
        
    }
    
    
}

#Preview {
    Intro1View()
}
