//
//  VendorView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//


import SwiftUI

struct VendorView: View {
    @State private var showVendorBanner = false
    @State private var currentCustomer: Customer? = nil
    private let vendorTimer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    // Sample waiting list
    @State private var waitingList: [Customer] = [
        Customer(name: "Ana Lorena Juárez", imageName: "Lore", interests: ["Ropa", "Zapatos"]),
        Customer(name: "Daniel Mansur", imageName: "Daniel", interests: ["Electrónicos"]),
        Customer(name: "Mario Rodríguez", imageName: "Marie", interests: ["Belleza", "Cocina", "Juguetes"]),
        Customer(name: "Raymond Lee", imageName: "Ray", interests: ["Ropa", "Zapatos"]),
        Customer(name: "Dana Zertuche", imageName: "Dana", interests: ["Belleza", "Cocina", "Juguetes"]),
        Customer(name: "Aylen", imageName: "Aylen", interests: ["Electrónicos"]),
        Customer(name: "Samuel Flores", imageName: "Samuel", interests: ["Belleza", "Cocina", "Juguetes"]),
        Customer(name: "Roberto", imageName: "Roberto", interests: ["Electrónicos"])
        
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                List(waitingList) { customer in
                    HStack {
                        Image(customer.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle()).padding(5)

                        VStack(alignment: .leading) {
                            Text(customer.name).font(.title3).bold()
                            Text(customer.interests.joined(separator: ", "))
                                .font(.caption)
                                .foregroundColor(.gray).font(.subheadline).bold()
                        }
                    }
                }
                if let cust = currentCustomer, showVendorBanner {
                    VStack {
                        
                        NotificationBanner(
                            title: "Cliente en zona",
                            subtitle: cust.name,
                            imageName: cust.imageName
                        )
                        .onTapGesture {
                            showVendorBanner = false
                            // Navigate to profile detail
                        }
                        Spacer()
                    }
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut, value: showVendorBanner)
                }
            }
            .onReceive(vendorTimer) { _ in
                guard !waitingList.isEmpty else { return }
                // Simulate next customer priority
                currentCustomer = waitingList.randomElement()
                withAnimation { showVendorBanner = true }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation { showVendorBanner = false }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            VendorView()
                .tabItem { Label("Vendedor", systemImage: "person.2") }
        }
    }
}
