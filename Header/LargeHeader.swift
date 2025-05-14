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
    @State var textSub: String
    @State var textHeadline: String
    @State var subFontSize: CGFloat = 20
    @State var headlineFontSize: CGFloat = 40

    
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
                                    Text(textSub)
                                        .font(.system(size: subFontSize))
                                        .foregroundColor(Color.white)
                                    Text(textHeadline)
                                        .font(.system(size: headlineFontSize))
                                        .foregroundColor(Color.white)
                                        .bold()
                                }
                                .opacity(showText ? 1 : 0)
                                .offset(y: showText ? -9 : 125)
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
            .background(Color.liverpoolPink)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 12)
            .overlay
            {

            }.navigationBarBackButtonHidden(true)
        }
        .onAppear {
            showText = true
        }
        // Change this in order to affect the space between the other screens and the header when called
        Spacer(minLength: 1)
    }
}


