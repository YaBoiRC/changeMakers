//
//  Customer.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI
import Combine

// Mock customer profile

struct Customer: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let interests: [String]
    var atendido: Bool = false
    var time_on_Store: Int = 0
    
    // Init custom que randomiza el tiempo
    init(name: String, imageName: String, interests: [String], atendido: Bool = false) {
        self.name = name
        self.imageName = imageName
        self.interests = interests
        self.atendido = atendido
        // Asigna entre 60 y 180 segundos
        self.time_on_Store = Int.random(in: 0...180)
    }
}
