//
//  HeaderView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

// Componente HeaderView
struct LargeHeader: View {

    @State private var showText: Bool = false
    @State var index: Int
    @Environment(\.presentationMode) var presentation
    @State var myView: AnyView = AnyView(HomeView())
    
    let LiverpoolPink = Color(
        red:   208.0/255.0,
        green:  51.0/255.0,
        blue:  152.0/255.0
    )
    
    var body: some View{
        ZStack {
            ZStack{
                VStack {
                    HStack {
                        Spacer(minLength: 0)
                        
                        if (self.index == 1)
                        {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Que te interesa...")
                                        .font(.system(.title, design: .serif))
                                        .foregroundColor(Color.white)
                                    Text("comprar?")
                                        .font(.system(.largeTitle, design: .serif))
                                        .foregroundColor(Color.white)
                                        .bold()
                                }
                                .opacity(showText ? 1 : 0)
                                .offset(y: showText ? 0 : 10)
                                .animation(.easeOut(duration: 1.0), value: showText)
                                Spacer()
                            }
                            .padding(.leading, 25)
                        }
                        Spacer(minLength: 0)
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top)
            }
            .background(LiverpoolPink)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 7)
            .overlay
            {

            }.navigationBarBackButtonHidden(true)
        }
        .onAppear {
            showText = true
        }
        // Change this in order to affect the space between the other screens and the header when called
        Spacer(minLength: 25)
    }
}

#Preview{
    LargeHeader(index: 1)
}
