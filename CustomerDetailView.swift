//
//  CustomerDetailView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI


struct CustomerDetailView: View {
    @Binding var customer: Customer
    
    var body: some View {
        
        VStack{
            CustomerHeader()
            
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    // Imagen de perfil
                    Image(customer.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.liverpoolPink, lineWidth: 4))
                        .shadow(radius: 5)
                        .offset(y: 60)
                }
                .frame(height: 200)
                .padding()
                
                // Contenido
                VStack(spacing: 20) {
                    // Nombre del cliente
                    Text(customer.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.liverpoolPink)
                    
                    // Tarjeta de información
                    VStack(alignment: .leading, spacing: 16) {
                        // Intereses
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Intereses")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            ForEach(customer.interests, id: \.self) { interest in
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.liverpoolPink)
                                    Text(interest)
                                        .foregroundColor(.primary)
                                }
                            }
                        }.foregroundStyle(Color.liverpoolPink)
                        
                        // Toggle de atención
                        Toggle(isOn: $customer.atendido) {
                            Text(customer.atendido ? "Atendido" : "Marcar como atendido")
                                .foregroundColor(.primary)
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .liverpoolPink))
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
                .padding()
                
                let wishlistItems = [
                    WishlistItem(itemName: "Mouse Gamer e621", itemDetail_1: "Color", itemDetail_2: "Azul y Amarillo", imageName: "mouseE621"),
                    WishlistItem(itemName: "Teclado Mecánico", itemDetail_1: "Color", itemDetail_2: "Negro RGB", imageName: "CorsairKeyboard"),
                    WishlistItem(itemName: "iBook Vintage", itemDetail_1: "Pulgadas", itemDetail_2: "10", imageName: "PoderosaiMac"),
                    
                    WishlistItem(itemName: "Mouse Gamer e621", itemDetail_1: "Color", itemDetail_2: "Azul y Amarillo", imageName: "mouseE621"),
                    WishlistItem(itemName: "Teclado Mecánico", itemDetail_1: "Color", itemDetail_2: "Negro RGB", imageName: "CorsairKeyboard"),
                    WishlistItem(itemName: "iBook Vintage", itemDetail_1: "Pulgadas", itemDetail_2: "10", imageName: "PoderosaiMac")
                ]
                
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("En base a su historial de compras")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(recommendedProducts) { product in
                                ProductCard(product: product)
                            }
                        }
                        .padding(.horizontal)
                        .scrollTargetLayout()
                        .scrollTargetBehavior(.paging)
                    }
                }
                .padding(.vertical)
                
                VStack{
                    Text("Wishlist")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal).foregroundStyle(Color.liverpoolPink)
                }
                
                ForEach(wishlistItems) { item in WishlistRowVendor(
                    
                    itemName: item.itemName,
                    itemDetail_1: item.itemDetail_1,
                    itemDetail_2: item.itemDetail_2,
                    imageName: item.imageName
                    
                    )
                }
                
            }
            
            
            
            .background(Color(.systemGroupedBackground)).navigationBarBackButtonHidden(true)
            
        }
        
    }
}


struct CustomerHeader: View {
    
        @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        ZStack {
            VStack {
                HStack(spacing: 12) {
                    
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    
                    
                    
                    Spacer()
                    
                    
                    Text("Customer")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.leading, -25)
                    
                    
                    Spacer()
                    

                }
                .padding(.horizontal, 16)
                .padding(.top)

                Spacer(minLength: 0)
            }
            
            Spacer()
        }
        .background(Color.liverpoolPink)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 12)
    }
}

// --- Modelo ---
struct Products: Identifiable {
    let id: Int
    let name: String
    let imageName: String
}

// --- Datos de ejemplo ---
let recommendedProducts: [Products] = [
    Products(id: 1, name: "Monitor", imageName: "PC Monitor"),
    Products(id: 2, name: "Teclado", imageName: "Keyboard"),
    Products(id: 3, name: "Play Station 5", imageName: "PS5"),
    Products(id: 4, name: "GTX", imageName: "GTX")
]

// --- La tarjeta de producto ---
struct ProductCard: View {
    let product: Products

    var body: some View {
        VStack(spacing: 0) {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .clipped()
                .scrollTransition(axis: .horizontal) { content, phase in
                    content.offset(x: phase.value * -80)
                }

            Text(product.name)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.liverpoolPink)
        }
        .frame(width: 300)
        .background(Color.liverpoolPink)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .onTapGesture {
            // Acción al pulsar: por ejemplo navegar a detalle
            print("Tapped on \(product.name)")
        }
    }
}

