//
//  BackButton.swift
//  categoriesProject
//
//  Created by Raymond Chavez on 11/03/25.
//
import SwiftUI

struct CustomBackButton: View {
    
    @Environment(\.presentationMode) private var presentationMode
    var arrowColor: Color
    @State private var animate = false

    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.3)) {
                animate = false
                presentationMode.wrappedValue.dismiss()
            }
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(arrowColor)
                .bold()
                .font(.title3)
                .scaleEffect(animate ? 0.9 : 0.75)
                .opacity(animate ? 0.9 : 0.5)
        }
        .padding(.leading, 8)
        .frame(width: 36, height: 36, alignment: .center)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                animate = true
            }
        }
    }
}


#Preview {
    NavigationView{
        CustomBackButton(arrowColor: Color.liverpoolPink)
    }
}
