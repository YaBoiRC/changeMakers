//
//  DistanceHelper.swift
//  changeMakers
//
//  Created by Raymond Chavez on 13/05/25.
//
import CoreLocation

// PARA HACER QUE EL GPS SE MUEVE VAS A IR A LO SIG:
// Product > Scheme > Edit Scheme > Default Location > Location.gpx

extension CLLocationCoordinate2D {
    func distance(from: CLLocationCoordinate2D) -> CLLocationDistance {
        let loc1 = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let loc2 = CLLocation(latitude: from.latitude, longitude: from.longitude)
        return loc1.distance(from: loc2)
    }
}
