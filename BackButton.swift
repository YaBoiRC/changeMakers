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
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left").foregroundColor(arrowColor).bold().font(.title3)
        }
        .offset(x: 15)
    }
}
