//
//  IntroView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct Intro1View: View {
    
    let LiverpoolPink = Color(
        red:   208.0/255.0,
        green:  51.0/255.0,
        blue:  152.0/255.0
    )
    
    var body: some View {
        
        VStack
        {
            
            Text("¿Que es Liverpool Here?")
                .padding(.vertical, 40)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(LiverpoolPink)
                .ignoresSafeArea(.all)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .offset(y: -27.9)
                //.shadow(radius: 10, y: 1)
            
            Text("¿Has pensado que es dificil encontrar lo que quieres en un mar de productos?")
                .font(.custom("AvenirNext-Bold", size: 20))
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            
            Text("\n¡Pasa unos cortos checks de preferencias y verificacion para tener un servicio personalizado y eficiente en todas tus compras fisicas!")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.70))
                .padding(.horizontal)
                .padding(.bottom)
            
                

        
                    
            Image("LiverpoolHereLogoTest")
                .resizable()
                .cornerRadius(25)
                .shadow(radius: 10, y: 3)
                .frame(width: 370, height: 220, alignment: .center)
                
            
                
                //.resizable()
            
            Text("Encuentra lo que amas, mas rapido!")
                .padding(.top, 40)
                .foregroundStyle(.black.opacity(0.65))
            
            
            
            
            
        }.ignoresSafeArea()
        
    }
}

#Preview {
    HomeView()
}
