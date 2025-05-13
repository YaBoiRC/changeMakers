//
//  WorkerSimView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct WorkerSimView: View {
    
    var bannerActive: Bool = true
    @State var index = 1
    @State var backArrow : Bool = false
    @Environment(\.presentationMode) var presentation
    
    //Cambiar para preview :3
    @State private var showIntroSheet = false
    
    let LiverpoolPink = Color(
        red:   208.0/255.0,
        green:  51.0/255.0,
        blue:  152.0/255.0
    )
    
    var body: some View {
        
        
        NavigationView{
            VStack(spacing: 0)
            {
                HeaderView(index: index, name: "Juanito", backArrow: false, sendDashboard: false)
                
                
                
                
                Text("Hola")
                
                
                
                Spacer()
                
                
                
                Button("Boton A Intro!",
                       action:
                        {
                    showIntroSheet = true
                        }
                ).frame(width: 300, height: 50)
                    .foregroundStyle(.white)
                    .background(LiverpoolPink)
                    .cornerRadius(4)
                    .sheet(isPresented: $showIntroSheet){IntroSwipeView()}
                
            }
        }
        
        
    }
}

#Preview {
    WorkerSimView()
}
