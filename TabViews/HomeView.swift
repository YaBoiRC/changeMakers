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
    @Environment(\.presentationMode) var presentation
    
    var body: some View
    {
        NavigationView{
            VStack(spacing: 0)
            {
                HeaderView(index: index, name: "Juanito", backArrow: false, sendDashboard: false)
                
                
            }
        }
    }
}

#Preview {
    HomeView()
}
