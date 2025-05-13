//
//  CustomerDetailView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI


struct CustomerDetailView: View {
    @Binding var customer: Customer
    
    var body: some View {
        
        VStack{
            CustomerHeader()
            
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    // Imagen de perfil
                    Image(customer.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.liverpoolPink, lineWidth: 4))
                        .shadow(radius: 5)
                        .offset(y: 60)
                }
                .frame(height: 200)
                .padding()
                
                // Contenido
                VStack(spacing: 20) {
                    // Nombre del cliente
                    Text(customer.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.liverpoolPink)
                    
                    // Tarjeta de información
                    VStack(alignment: .leading, spacing: 16) {
                        // Intereses
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Intereses")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            ForEach(customer.interests, id: \.self) { interest in
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.liverpoolPink)
                                    Text(interest)
                                        .foregroundColor(.primary)
                                }
                            }
                        }.foregroundStyle(Color.liverpoolPink)
                        
                        // Toggle de atención
                        Toggle(isOn: $customer.atendido) {
                            Text(customer.atendido ? "Atendido" : "Marcar como atendido")
                                .foregroundColor(.primary)
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .liverpoolPink))
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
                .padding()
            }
            
            .background(Color(.systemGroupedBackground)).navigationBarBackButtonHidden(true)
        }
    }
}

struct CustomerHeader: View {
    
        @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        ZStack {
            VStack {
                HStack(spacing: 12) {
                    
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    
                    
                    
                    Spacer()
                    
                    
                    Text("Customer")
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.leading, -25)
                    
                    
                    Spacer()
                    

                }
                .padding(.horizontal, 16)
                .padding(.top)

                Spacer(minLength: 0)
            }
            
            Spacer()
        }
        .background(Color.liverpoolPink)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 12)
    }
}
