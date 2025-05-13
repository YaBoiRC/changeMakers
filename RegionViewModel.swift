//
//  RegionViewModel.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI
import MapKit

class RegionViewModel: ObservableObject {
    @Published var region: MKCoordinateRegion
    
    init(initial: MKCoordinateRegion) {
        self.region = initial
    }
}
