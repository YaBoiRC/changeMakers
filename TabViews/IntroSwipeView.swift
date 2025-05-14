//
//  IntroSwipeView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct IntroSwipeView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    Intro1View()
                    Intro2View()
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

                VStack {
                    NavigationLink(destination: TermsAndConditionsView()) {
                        Text("Activar → ")
                            .frame(width: 300, height: 50)
                            .foregroundStyle(.white)
                            .background(Color.liverpoolPink)
                            .cornerRadius(4)
                    }

                    Button("Regresar", action: {
                        // Back action (can be customized)
                    })
                    .frame(width: 300, height: 50)
                    .foregroundStyle(Color.liverpoolPink)
                    .border(Color.liverpoolPink, width: 1)
                }
            }
        }
    }
}

#Preview {
    IntroSwipeView()
}
