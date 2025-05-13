//
//  WishlistView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI



//========================================================================



struct WishlistItem: Identifiable {
    let id = UUID()
    let itemName: String
    let itemDetail_1: String
    let itemDetail_2: String
    let imageName: String
}




//========================================================================



struct WishlistView: View {
    
    var bannerActive: Bool = true
    @State var index = 1
    @State var backArrow : Bool = false
    
    @Environment(\.presentationMode) var presentation
    
        let wishlistItems = [
            WishlistItem(itemName: "Mouse Gamer e621", itemDetail_1: "Color", itemDetail_2: "Azul y Amarillo", imageName: "mouseE621"),
            WishlistItem(itemName: "Teclado Mecánico", itemDetail_1: "Color", itemDetail_2: "Negro RGB", imageName: "CorsairKeyboard"),
            WishlistItem(itemName: "iBook Vintage", itemDetail_1: "Pulgadas", itemDetail_2: "10", imageName: "PoderosaiMac"),
            
            WishlistItem(itemName: "Mouse Gamer e621", itemDetail_1: "Color", itemDetail_2: "Azul y Amarillo", imageName: "mouseE621"),
            WishlistItem(itemName: "Teclado Mecánico", itemDetail_1: "Color", itemDetail_2: "Negro RGB", imageName: "CorsairKeyboard"),
            WishlistItem(itemName: "iBook Vintage", itemDetail_1: "Pulgadas", itemDetail_2: "10", imageName: "PoderosaiMac")
        ]
    
    
    
    var body: some View {
        
        
        
        VStack
        {
            
            WishHeader()
            
            ZStack//PARA FONDO DE SCROLL
            {
                
                Color.black.opacity(0.06).ignoresSafeArea()
                
                ScrollView //IMPLEMENTAR FOR EACH PARA MOSTRAR VARIOS PRODUCTOS
                {
                            VStack(spacing: 20) {
                                
                                
                                
                                ForEach(wishlistItems) { item in WishlistRow(
                                    
                                    itemName: item.itemName,
                                    itemDetail_1: item.itemDetail_1,
                                    itemDetail_2: item.itemDetail_2,
                                    imageName: item.imageName
                                    
                                    )
                                }
                                
                                
                            }
                            .padding()
                        }
                
                Spacer(minLength: 0)
            }
            
        }
        
        
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
                        .padding(.leading, 28)
                    
                    
                    Spacer()
                    

                    Button(action: {
                        // Cart action
                    }) {
                        Image(systemName: "bag")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    Image(systemName: "ellipsis")
                        .rotationEffect(.init(degrees: 90))
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
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
