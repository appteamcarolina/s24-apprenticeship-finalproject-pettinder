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
    @Published var postalcode: String
    @Published var miles = 25
    
    init(postalcode: String) {
        self.postalcode = postalcode
    }
    
    enum loadingState {
        case idle
        case loading
        case working
    }
    
    func fetchPets() async throws {
        state = .loading
        let data = try await PetService.fetchPets(miles: miles, postalcode: postalcode)
        pets = data.data
        included = data.included
        state = .working
    }
    
}
