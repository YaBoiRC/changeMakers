//
//  IntroSwipeView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct IntroSwipeView: View {
    
    let LiverpoolPink = Color(
        red:   208.0/255.0,
        green:  51.0/255.0,
        blue:  152.0/255.0
    )
    var body: some View {
        
        TabView {
                    Intro1View()
                    Intro2View()
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        VStack //   HSTACK BOTONES
        {
            
            
            
            Button("Activar → ",
                   action:
                    {
                
                    }
            )//Button
            .frame(width: 300, height: 50)
            .foregroundStyle(.white)
            .background(LiverpoolPink)
            .cornerRadius(4)
            
            
            
            
            
            Button("Regresar",
                   action:
                    {
                
                    }
            )//Button
            
            .frame(width: 300, height: 50)
            .foregroundStyle(LiverpoolPink)
            .border(LiverpoolPink, width: 1)
            
            
           
            
        }//    HSTACK BOTONES
        
    }
}

#Preview {
    ContentView()
}
