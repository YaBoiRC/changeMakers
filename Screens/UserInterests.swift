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
                    .strokeBorder(isSelected ? Color.blue : Color.gray, lineWidth: 2)
                    .background(Circle().fill(isSelected ? Color.blue.opacity(0.2) : Color.clear))
                    .frame(width: 80, height: 80)
                
                Image(systemName: interest.imageName)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
                    .padding(20)
                    .foregroundColor(isSelected ? .blue : .gray)
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
        Interest(name: "Music", imageName: "music.note"),
        Interest(name: "Art", imageName: "paintpalette"),
        Interest(name: "Sports", imageName: "soccerball"),
        Interest(name: "Tech", imageName: "desktopcomputer"),
        Interest(name: "Nature", imageName: "leaf"),
    ]
    
    @State private var selectedInterests: Set<Interest> = []

    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                LargeHeader(index: 1)
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
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(arrowColor: Color.white))
    }
}

#Preview {
    InterestSelectionView()
}
