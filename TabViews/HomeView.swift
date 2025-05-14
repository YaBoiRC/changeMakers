//
//  HomeView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//


import SwiftUI

// MARK: - Datos de ejemplo
let promoImages = ["promo2", "promo3", "promo1"]
let categories: [Interest] = [
    Interest(name: "Ropa", imageName: "tshirt"),
    Interest(name: "Electrónicos", imageName: "ipad"),
    Interest(name: "Juguetes", imageName: "gamecontroller"),
    Interest(name: "Hogar", imageName: "bed.double"),
    Interest(name: "Belleza", imageName: "sparkles")
]
struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let imageName: String
}
let products = [
    Product(name: "Playera Casual", price: "499", imageName: "shirt1"),
    Product(name: "Audífonos", price: "1,299", imageName: "headphones"),
    Product(name: "Sofá Moderno", price: "8,999", imageName: "sofa"),
    Product(name: "Set de Cocina", price: "2,299", imageName: "kitchen")
]

// MARK: - Vista Raíz con Tab Bar
struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
        TabView {
            // ——————— INICIO ———————
            NavigationView {
                VStack(spacing: 0) {
                    HomeHeader(searchText: $searchText)

                    ScrollView {
                        // 1. Carousel de promociones
                        TabView {
                            ForEach(promoImages, id: \.self) { img in
                                Image(img)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 180)
                                    .clipped()
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .frame(height: 180)

                        // 2. Sección de categorías
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(categories) { cat in
                                    VStack {
                                        Circle()
                                            .fill(Color(.systemGray6))
                                            .frame(width: 60, height: 60)
                                            .overlay(
                                                Image(systemName: cat.imageName)
                                                    .font(.title2)
                                                    .foregroundColor(.liverpoolPink)
                                            )
                                        Text(cat.name)
                                            .font(.caption)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 100)

                        // 3. Grid de productos
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(products) { prod in
                                VStack(alignment: .leading) {
                                    Image(prod.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                    Text(prod.name)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                    Text("$\(prod.price)")
                                        .font(.headline)
                                        .foregroundColor(.liverpoolPink)
                                }
                                .padding(8)
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(radius: 2, x: 0, y: 1)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .background(Color(.systemGroupedBackground))
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Inicio")
            }

            // ——————— CATEGORÍAS ———————
            NavigationView {
                VendorView()
            }
            .tabItem {
                Image(systemName: "square.grid.2x2.fill")
                Text("Categorías")
            }

            // ——————— Mapa ———————
            NavigationView {
                MapView()
            }
            .tabItem {
                Image(systemName: "location.fill")
                Text("Nearby")
            }

            // ——————— PERFIL ———————
            NavigationView {
                RegistrationView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Perfil")
            }
        }
        .accentColor(.liverpoolPink)
    }
}

// Componente HeaderView
struct HomeHeader: View {
    @Binding var searchText: String
    
    var body: some View{
        ZStack {
            VStack {
                HStack(spacing: 12) {
                    TextField("Buscar...", text: $searchText)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(8)
                        .layoutPriority(1)

                    Button(action: {
                        // Wishlist action
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                            .font(.title2)
                    }

                    Button(action: {
                        // Cart action
                    }) {
                        Image(systemName: "cart.fill")
                            .foregroundColor(.white)
                            .font(.title2)
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

// MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
