//
//  IntroSwipeView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct IntroSwipeView: View {
    
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
            .background(Color.liverpoolPink)
            .cornerRadius(4)
            
            
            
            
            
            Button("Regresar",
                   action:
                    {
                
                    }
            )//Button
            
            .frame(width: 300, height: 50)
            .foregroundStyle(Color.liverpoolPink)
            .border(Color.liverpoolPink, width: 1)
            
            
           
            
        }//    HSTACK BOTONES
        
    }
}

#Preview {
    IntroSwipeView()
}
