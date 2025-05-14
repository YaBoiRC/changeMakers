//
//  WishListRowVendor.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct WishlistRowVendor: View {
    
    var itemName = String()
    var itemDetail_1 = String()
    var itemDetail_2 = String()
    var imageName = String()
    
    var body: some View {
        
            
            //Cuerpo Row Principal
            VStack(alignment: .leading)
            {
                //Filas de los elementos
                HStack()
                {
                    
                    
                    
                    Image(imageName)//CAMBIAR IMAGEN A OTRA
                        .resizable()
                        .frame(width: 90, height: 100)
                        .padding()
                    
                    


                    
                    //Nombre de Item y descripcion general
                    VStack(alignment: .leading)
                    {
                        Text(itemName)//CAMBIAR TEXTO A OTRO
                            .font(.system(size: 20))
                            .padding(.bottom)
                        
                        HStack
                        {
                            
                            Text(itemDetail_1)//ok :3
                                .multilineTextAlignment(.leading)
                                .font(.subheadline)
                                .foregroundStyle(Color.black.opacity(0.5))
                                .fontWeight(.bold)
                            
                            Text(":")//ok :3
                                .multilineTextAlignment(.leading)
                                .font(.subheadline)
                                .foregroundStyle(Color.black.opacity(0.7))
                            
                            Text(itemDetail_2)//ok :3
                                .multilineTextAlignment(.leading)
                                .font(.subheadline)
                                .foregroundStyle(Color.black.opacity(0.7))
                        }
                        
                            
                    }
                    
                    Spacer()
                    
                    
                    Button(action: {
                        // Cart action
                    }) {
                        Image(systemName: "ellipsis")
                            .padding(.trailing)
                            .rotationEffect(.init(degrees: 90))
                            .offset(y: -30)
                            .foregroundStyle(Color.black).opacity(0.8)
                            
                    }
                    
                    
                    
                    
                }
                
                HStack(alignment: .center)//BOTONES
                {
                    
                    Spacer()
                    
                    
                    
                    Button("Ver información de producto",
                           action:
                            {
                        
                            }
                    )//Button
                    .frame(width: 250, height: 40)
                    .foregroundStyle(.white)
                    .background(Color.liverpoolPink)
                    .cornerRadius(4)
                    

                    Spacer()
                }
                .padding(.bottom)
                
                
                
                
                
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 4.5)
            //.border(Color.gray)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)

            

    }
}
