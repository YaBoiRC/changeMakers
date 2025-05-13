//
//  NotificationBanner.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

// Notification Banner View
struct NotificationBanner: View {
    let title: String
    let subtitle: String
    let imageName: String
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle()).padding(6.6)
            
            VStack(alignment: .leading) {
                Text(title).bold()
                Text(subtitle).font(.subheadline)
            }
            Spacer()
        }
        .padding()
        .background(Color.liverpoolPink)
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}
