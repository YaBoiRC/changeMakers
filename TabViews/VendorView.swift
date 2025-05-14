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
    @State private var isShowingDetail = false

    private let vendorTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    private let incrementTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var waitingList: [Customer] = [
        Customer(name: "Ana Lorena Juárez", imageName: "Lore", interests: ["Ropa", "Zapatos"], atendido: false),
        Customer(name: "Daniel Mansur", imageName: "Daniel", interests: ["Electrónicos"], atendido: true),
        Customer(name: "Mario Rodríguez", imageName: "Marie", interests: ["Belleza", "Cocina", "Juguetes"], atendido: false),
        Customer(name: "Raymond Lee", imageName: "Ray", interests: ["Ropa", "Zapatos"], atendido: true),
        Customer(name: "Dana Zertuche", imageName: "Dana", interests: ["Belleza", "Cocina", "Juguetes"], atendido: false),
        Customer(name: "Aylen", imageName: "Aylen", interests: ["Electrónicos"]),
        Customer(name: "Samuel Flores", imageName: "Samuel", interests: ["Belleza", "Cocina", "Juguetes"], atendido: false),
        Customer(name: "Roberto Chapa", imageName: "Roberto", interests: ["Electrónicos"], atendido: true)
        
    ].map { cust in
        var c = cust
        c.time_on_Store = Int.random(in: 0...180)
        return c
    }

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach($waitingList) { $customer in
                        HStack {
                            Image(customer.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .padding(5)
                            VStack(alignment: .leading) {
                                Text(customer.name).font(.title3).bold().foregroundStyle(Color.liverpoolPink)
                                Text("Esperando: \(customer.time_on_Store)s")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(customer.interests.joined(separator: ", "))
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                        }
                        .opacity(customer.atendido ? 0.5 : 1.0)
                        .onTapGesture {
                            customer.atendido = true
                        }
                    }
                }

                // Banner de notificación
                if let cust = currentCustomer, showVendorBanner {
                    VStack {
                        NotificationBanner(
                            title: "Cliente en zona",
                            subtitle: cust.name,
                            imageName: cust.imageName
                        )
                        .onTapGesture {
                            showVendorBanner = false
                            
                            if let idx = waitingList.firstIndex(where: { $0.id == cust.id }) {
                                // Pasamos binding al detalle
                                currentCustomer = waitingList[idx]
                                isShowingDetail = true
                            }
                        }
                        Spacer()
                    }
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut, value: showVendorBanner)
                }
            }
            // Trigger del banner
            .onReceive(vendorTimer) { _ in
                guard !isShowingDetail,
                      !waitingList.filter({ !$0.atendido }).isEmpty
                else { return }
                currentCustomer = waitingList.filter { !$0.atendido }.randomElement()
                withAnimation { showVendorBanner = true }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation { showVendorBanner = false }
                }
            }
            .onReceive(incrementTimer) { _ in
                for idx in waitingList.indices where !waitingList[idx].atendido {
                    waitingList[idx].time_on_Store += 1
                }
            }
            .navigationDestination(isPresented: $isShowingDetail) {
                if let custIndex = waitingList.firstIndex(where: { $0.id == currentCustomer?.id }) {
                    CustomerDetailView(customer: $waitingList[custIndex])
                }
            }
            
        }
    }
}

#Preview {
    VendorView()
}
