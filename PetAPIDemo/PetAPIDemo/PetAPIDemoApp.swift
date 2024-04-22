//
//  PetAPIDemoApp.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import SwiftUI
import SwiftData

@main
struct PetAPIDemoApp: App {
    let locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
        .modelContainer(for: AnimalDataItem.self)
    }
}
