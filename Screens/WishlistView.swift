//
//  WishlistView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct WishlistView: View {
    
    var bannerActive: Bool = true
    @State var index = 1
    @State var backArrow : Bool = false
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WishlistView()
}
