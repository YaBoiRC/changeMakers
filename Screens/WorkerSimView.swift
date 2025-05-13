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

    var body: some View {
        
        
        NavigationView{
            VStack(spacing: 0)
            {
                WorkerHeader()
                
                Text("Hola")
                
                Spacer()
                
                Button("Boton A Intro!",
                       action:
                        {
                    showIntroSheet = true
                        }
                ).frame(width: 300, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.liverpoolPink)
                    .cornerRadius(4)
                    .sheet(isPresented: $showIntroSheet){IntroSwipeView()}
                
            }
        }
        
        
    }
}

// Componente HeaderView
struct WorkerHeader: View {
    
    var body: some View
    {
        ZStack {
            VStack {
                HStack(spacing: 12) {
                    Spacer()
                    Text("Mapa")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top)

                Spacer(minLength: 0)
            }
        }
        .background(Color.liverpoolPink)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 12)
    }
}

#Preview {
    WorkerSimView()
}
