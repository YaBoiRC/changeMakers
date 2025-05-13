//
//  UserInterests.swift
//  changeMakers
//
//  Created by Raymond Chavez on 12/05/25.
//

import SwiftUI

struct Interest: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct InterestButtonView: View {
    let interest: Interest
        @Binding var isSelected: Bool

        var body: some View {
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .fill(isSelected ? Color.liverpoolPink.opacity(0.2) : Color(.systemGray6))
                        .frame(width: 80, height: 80)
                    Image(systemName: interest.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 34)
                        .foregroundColor(isSelected ? .liverpoolPink : .gray)
                    
                    if isSelected {
                        Circle()
                            .fill(Color.liverpoolPink)
                            .frame(width: 18, height: 18)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .font(.system(size: 10))
                                    .foregroundColor(.white)
                            )
                            .offset(x: 30, y: -30)
                    }
                }
                Text(interest.name)
                    .font(.footnote)
                    .foregroundColor(.primary)
            }
            .onTapGesture { isSelected.toggle() }
        }
}

struct InterestSelectionView: View {
    let interests: [Interest] = [
        Interest(name: "Ropa", imageName: "tshirt"),
        Interest(name: "Electrónicos", imageName: "ipad"),
        Interest(name: "Juguetes", imageName: "gamecontroller"),
        Interest(name: "Hogar", imageName: "bed.double"),
        Interest(name: "Belleza", imageName: "sparkles"),
        Interest(name: "Zapatos", imageName: "shoeprints.fill"),
        Interest(name: "Accesorios", imageName: "bag"),
        Interest(name: "Videojuegos", imageName: "gamecontroller.fill"),
        Interest(name: "Muebles", imageName: "sofa.fill"),
        Interest(name: "Cocina", imageName: "fork.knife")
    ]
    
    @State var selectedInterests: Set<Interest> = []
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                InterestsHeader()
                
                ScrollView {
                    Text("¿Qué te gustaría comprar?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top, 30)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 20)], spacing: 20) {
                        ForEach(interests) { interest in
                            InterestButtonView(
                                interest: interest,
                                isSelected: Binding(
                                    get: { selectedInterests.contains(interest) },
                                    set: { isSelected in
                                        if isSelected {
                                            selectedInterests.insert(interest)
                                        } else {
                                            selectedInterests.remove(interest)
                                        }
                                    }
                                )
                            )
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            
            // Botones al fondo visibles
            VStack(spacing: 12) {
                NavigatingButtonView(
                    style: 0,
                    text: "Continuar",
                    color: selectedInterests.count > 3 ? .liverpoolPink : .gray,
                    destination: TermsAndConditionsView(),
                    hasNavigation: selectedInterests.count > 3,
                    foregroundCol: .white
                )
                .disabled(selectedInterests.count <= 3)
                
                NavigatingButtonView(
                    style: 3,
                    text: "Saltar",
                    color: .clear,
                    destination: TermsAndConditionsView(),
                    hasNavigation: true,
                    foregroundCol: Color.gray
                )
            }
            .padding(.bottom, 30) // Asegura espacio con la parte inferior
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarItems(leading: CustomBackButton(arrowColor: Color.white))
    }
    
    
    /*
     struct InterestsHeader: View {
     
     var body: some View{
     ZStack {
     VStack {
     HStack(spacing: 12) {
     Spacer()
     Text("Intereses")
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
     }*/
    
    struct InterestsHeader: View {
        
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
                        
                        
                        Text("Intereses")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .font(.title2)
                            .padding(.leading, -37)
                        
                        
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
}


#Preview {
    NavigationView{
        InterestSelectionView()
    }
}
