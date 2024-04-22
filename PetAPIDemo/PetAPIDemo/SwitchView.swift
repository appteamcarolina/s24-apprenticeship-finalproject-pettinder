//
//  ContentView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import SwiftUI
import CoreLocation

struct SwitchView: View {
    @StateObject var vm: PetViewModel
    @State private var showingSavedView = false

    var body: some View {
        switch vm.state {
        case .idle:
            IdleView(vm: vm)
        case .loading:
            LoadingView()
        case .working:
            NavigationStack {
                SwipeView(vm: vm)
            }
        }
    }
}

#Preview {
    SwitchView(vm: PetViewModel(userLoc: CLLocation(latitude: 35.913200, longitude: -79.055847)))
}
