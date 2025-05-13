//
//  TermsAndConditions.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct TermsAndConditionsView: View
{
    @State private var conditions = false
    @State private var notifications = false
    @State var index = 1
    @State var backArrow : Bool = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View
    {
        VStack(spacing: 0) {
            
            LargeHeader(index: 1, textSub: "Encuentra lo que buscas con...", textHeadline: "Liverpool Here")
            
            ScrollView {
                Spacer()
                Text("""
            
            **Términos y Condiciones de Uso de la Aplicación**
            
            Última actualización: 13 Mayo 2025
            Bienvenido/a a nuestra aplicación ("la App"), desarrollada como un prototipo para mejorar la experiencia de compra dentro de tiendas Liverpool. Al utilizar esta App, aceptas los siguientes Términos y Condiciones. Si no estás de acuerdo con ellos, por favor no utilices la aplicación.
            
            **1. Finalidad de la Aplicación**
            
            La App tiene como objetivo ofrecer a los usuarios una experiencia de compra personalizada dentro de las tiendas Liverpool. Para lograrlo, la App puede:
            Notificar a los empleados de la tienda cuando un usuario ingrese al establecimiento.
            Identificar las áreas o departamentos donde hay artículos de interés para el usuario.
            Permitir que el personal pueda asistir de manera proactiva al usuario durante su visita.
            
            **2. Recopilación y Uso de Información Personal**
            
            a. Lista de Deseos y Preferencias
            
            El usuario podrá ingresar manualmente sus preferencias o vincular su wishlist existente en Liverpool. Esta información se utilizará únicamente para proporcionar recomendaciones personalizadas y asistencia en tienda.
            
            b. Acceso y Uso de Ubicación
            
            La App podrá acceder a la ubicación del dispositivo para detectar la entrada del usuario a la tienda o su proximidad a departamentos específicos.
            
            El usuario podrá elegir entre las siguientes opciones de privacidad:
            
            Compartir ubicación solo mientras usa la App.
            
            Compartir ubicación en todo momento (en segundo plano).
            
            El tipo de acceso será configurable desde los ajustes del dispositivo y de la App.
            
            c. Uso de Imagen Facial (Foto)
            
            El usuario podrá ingresar una fotografía de su rostro de forma voluntaria. Esta imagen se usará exclusivamente para que el personal de Liverpool pueda reconocer al usuario y ofrecerle asistencia personalizada durante su visita.
            
            La fotografía no será compartida con terceros ni usada para fines distintos a los aquí descritos.
            
            **3. Notificaciones al Personal de Liverpool**
            
            Cuando el usuario entre en la tienda o se aproxime a un área relevante para sus intereses, la App podrá enviar una notificación al personal autorizado de Liverpool. Esta notificación podrá incluir:
            
            Nombre o alias del usuario.
            
            Preferencias o productos de interés.
            
            Fotografía ingresada por el usuario (si aplica).
            
            **4. Privacidad y Protección de Datos**
            
            Nos comprometemos a proteger tu información personal. Todos los datos recopilados se almacenan de forma segura y se utilizan únicamente para los fines aquí descritos.
            El usuario puede en cualquier momento solicitar la eliminación de sus datos desde la configuración de la App o contactando al equipo de soporte.
            
            **5. Limitaciones de Uso**
            
            La App está diseñada como un prototipo en fase de prueba. Por tanto:
            Su funcionalidad puede cambiar sin previo aviso.
            Podrían ocurrir fallos técnicos o imprecisiones.
            No se garantiza la disponibilidad del servicio en todas las tiendas Liverpool.
            
            **6. Modificaciones a los Términos**
            
            Nos reservamos el derecho de actualizar estos Términos y Condiciones en cualquier momento. Recomendamos revisar esta sección periódicamente para mantenerse informado sobre los cambios.
            
            """)
                .padding([.leading, .bottom, .trailing], 20)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Toggle("Acepto los términos y condiciones", isOn: $conditions)
                    .toggleStyle(CheckboxToggleStyle())
                    .padding(.horizontal, 20)
                
                Toggle("Deseo recibir notificaciones", isOn: $notifications)
                    .toggleStyle(CheckboxToggleStyle())
                    .padding(.horizontal, 20)
                
                
                VStack(alignment: .center){
                    
                    Text("Para más información, revisa nuestro ")
                    + Text("Aviso de Privacidad")
                        .foregroundColor(.blue)
                        .underline()
                    
                    
                    if (conditions == true && notifications == true)
                    {
                        NavigatingButtonView(style: 0, text: "Aceptar", color: Color.liverpoolPink, destination: InterestSelectionView(), hasNavigation: true, foregroundCol: Color.white)
                    }
                    else
                    {
                        
                        NavigatingButtonView(style: 0, text: "Aceptar", color: Color.gray, destination: InterestSelectionView(), hasNavigation: false, foregroundCol: Color.white)
                        
                    }
                    
                }
            }
            .padding(.all)
            .frame(maxWidth: .infinity, maxHeight: 140)
            .background(Color.gray.opacity(0.3)).ignoresSafeArea(.all)
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton(arrowColor: Color.white))
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    NavigationView {
        TermsAndConditionsView()
    }
}
