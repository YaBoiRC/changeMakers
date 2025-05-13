//
//  WishlistView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct WishlistView: View {
    
    var bannerActive: Bool = true
    @State var index = 1
    @State var backArrow : Bool = false
    
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        
        WishHeader()
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
        
        
        Spacer(minLength: 0)
    }
}


// Componente HeaderView
struct WishHeader: View {

    
    var body: some View{
        ZStack {
            VStack {
                HStack(spacing: 12) {
                    
                    
                    Button(action: {
                        // Cart action
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    
                    
                    
                    Spacer()
                    
                    
                    Text("Wishlist")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.title2)
                    
                    
                    Spacer()
                    

                    Button(action: {
                        // Cart action
                    }) {
                        Image(systemName: "bag")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
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
    WishlistView()
}
