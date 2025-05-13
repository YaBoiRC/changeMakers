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
        ZStack{
            VStack(spacing: 0) {
                //InterestsHeader()
                
                LargeHeader(index: 1, textSub: "Que le interesa...", textHeadline: "comprar?")
                VStack(alignment: .leading, spacing: 16) {
                    ScrollView {
                        
                        //Text("¿Qué le interesa comprar?").font(.title2).fontWeight(.bold).foregroundColor(.primary).padding(.top)
                        
                        Text("Escoge tus intereses").font(.title2).fontWeight(.bold).foregroundColor(.primary).padding(.top, 30)
                        
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
                    .padding(.bottom, 20)
                }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    VStack()
                    {
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
                            text: "skip",
                            color: .gray.opacity(0),
                            destination: TermsAndConditionsView(),
                            hasNavigation: true,
                            foregroundCol: Color.gray
                        )
                        
                        
                        //funny
//                        Text("|").rotationEffect(.degrees(90)).offset(x:20 ,y: -15).font(.largeTitle).foregroundColor(Color.gray).padding(.all, -20).fontWidth(.condensed)
                        
                        
                    }
                    
                    
                    
                    
                    
                    Spacer()
                }
                .padding(.bottom, -20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(arrowColor: Color.white))
    }
}

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
}

#Preview {
    NavigationView{
        InterestSelectionView()
    }
}
