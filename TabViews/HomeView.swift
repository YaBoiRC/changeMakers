//
//  HomeView.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct HomeView: View
{
    var bannerActive: Bool = true
    @State var index = 1
    @State var backArrow : Bool = false
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentation
    
    var body: some View
    {
        NavigationView
        {
            VStack(spacing: 0)
            {
                HomeHeader(searchText: $searchText)
                Spacer()
                VStack{
                    if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        Text("Searching for: \(searchText)")
                    }
                }
                
            }
        }
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

#Preview {
    HomeView()
}
