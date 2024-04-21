//
//  SwipeView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/10/24.
//

import SwiftUI

struct SwipeView: View {
    @StateObject var vm: PetViewModel
    @State var isShowingMoreInfo = false

    var body: some View {
        TabView {
            VStack {
                ZStack {
                    Image("whisker-bg2")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                    Button {
                        Task {
                            try await vm.fetchPets()
                        }
                    } label: {
                        HStack {
                            Text("Refresh Pets!")
                                .font(.title3)
                                .foregroundColor(Color.white)
                                .bold()
                            
                            Image(systemName: "pawprint.fill")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 30)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.pink, .yellow1]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(30)
                    }
                    ForEach(vm.pets, id: \.self) { pet in
                        let index = vm.pets.firstIndex(of: pet)
                        CardView(vm: PetCardViewModel(pet: pet, included: vm.included[index!]))
                    }
                }
            }
                .tabItem {
                    Label("Swipe", systemImage: "arrowshape.turn.up.forward")
                }
                .toolbarBackground(.visible, for: .tabBar)
                SavedView()
                    .tabItem {
                        Label("Saved", systemImage: "tray.full.fill")
                            .padding(.top)
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                FilterView(showingMoreInfo: $isShowingMoreInfo, vm: vm)
                    .tabItem {
                        Label("Settigs", systemImage: "gear")
                            .toolbarBackground(.visible, for: .tabBar)
                    }
            }
        }
    }

#Preview {
    NavigationStack {
        SwipeView(vm: PetViewModel())
    }
}
