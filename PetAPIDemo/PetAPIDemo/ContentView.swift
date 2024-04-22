//
//  ContentView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSavedView = false
    @EnvironmentObject private var locationManager: LocationManager

    var body: some View {
        if locationManager.hasLocationAccess {
            if let userLocation = locationManager.userLocation {
                SwitchView(vm: PetViewModel(userLoc: userLocation))
            }
            Text("\(locationManager.userLocation)")
        } else {
            RequestLocationAccessView()
        }
    }
}

#Preview {
    ContentView().environmentObject(LocationManager())
}
