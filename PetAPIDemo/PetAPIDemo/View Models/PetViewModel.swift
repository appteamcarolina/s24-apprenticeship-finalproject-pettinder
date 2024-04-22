//
//  PetViewModel.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import Foundation
import UIKit
import CoreLocation

@MainActor
class PetViewModel: ObservableObject {
    @Published var pets: [Animal] = []
    @Published var included: [Included] = []
    @Published var state: loadingState = .idle
    @Published var userLoc: CLLocation
    @Published var miles = 25
    @Published var postal = 27707
    
    init(userLoc: CLLocation) {
        self.userLoc = userLoc
    }
    
    enum loadingState {
        case idle
        case loading
        case working
    }
    
    func fetchPets() async throws {
        state = .loading
        let data = try await PetService.fetchPets()
        pets = data.data
        included = data.included
        state = .working
    }
    
}
