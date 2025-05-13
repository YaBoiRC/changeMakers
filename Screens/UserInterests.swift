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
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .strokeBorder(isSelected ? Color.liverpoolPink : Color.gray, lineWidth: 2)
                    .background(Circle().fill(isSelected ? Color.liverpoolPink.opacity(0.2) : Color.clear))
                    .frame(width: 80, height: 80)
                
                Image(systemName: interest.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(20)
                    .foregroundColor(isSelected ? .liverpoolPink : .gray)
            }
            
            Text(interest.name)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .onTapGesture {
            isSelected.toggle()
        }
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
                LargeHeader(index: 1, textSub: "Que le interesa...", textHeadline: "comprar?")
                VStack(alignment: .leading, spacing: 16) {
                    ScrollView {
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
                    NavigatingButtonView(
                        style: 0,
                        text: "Continuar",
                        color: selectedInterests.count > 3 ? .liverpoolPink : .gray,
                        destination: TermsAndConditionsView(),
                        hasNavigation: selectedInterests.count > 3
                    )
                    .disabled(selectedInterests.count <= 3)
                    Spacer()
                }
                .padding(.bottom, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(arrowColor: Color.white))
    }
}

#Preview {
    NavigationView{
        InterestSelectionView()
    }
}
