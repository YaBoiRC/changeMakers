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
}
