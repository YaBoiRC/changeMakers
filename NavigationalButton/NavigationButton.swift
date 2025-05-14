//
//  NavigationButton.swift
//  changeMakers
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct NavigatingButtonView<Destination: View>: View
{
    var style: Int
    var text: String
    var color: Color
    var destination: Destination
    var hasNavigation: Bool
    var foregroundCol: Color
    
    // Styles only affects if either the background color changes (Text is white and button bg is red) or if the text changes (Text is red and button is white)
    
    var body: some View
    {
        VStack
        {
            Button(action:{})
            {
                if (style == 1 && hasNavigation)
                {
                    NavigationLink(destination: destination)
                    {
                        Text(text)
                            .foregroundColor(color)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: 200, maxHeight: 40)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                }
                else if (style == 0 && hasNavigation)
                {
                    NavigationLink(destination: destination)
                    {
                        Text(text)
                            .foregroundColor(foregroundCol)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: 200, maxHeight: 40)
                            .background(color)
                            .cornerRadius(5)
                            .shadow(radius: 10, x: 0, y: 3)
                    }
                }
                
                else if (style == 0 && !hasNavigation)
                {
                    NavigationLink(destination: destination)
                    {
                        Text(text)
                            .foregroundColor(foregroundCol)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: 200, maxHeight: 40)
                            .background(color)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                            .shadow(radius: 109, x: 0, y: 3)
                    }
                }
                
                else if (style == 3 ) //Para boton skip en UserInterests
                {
                    NavigationLink(destination: destination)
                    {
                        Text(text)
                            .underline()
                            .foregroundColor(foregroundCol)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: 200, maxHeight: 40)
                            .background(color)
                            .cornerRadius(5)
                            
    
                    }
                }
                
                
                else
                {
                    Text(text)
                        .foregroundColor(foregroundCol)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: 200, maxHeight: 40)
                        .background(color)
                        .cornerRadius(5)
                }
            }
        }
    }
}



