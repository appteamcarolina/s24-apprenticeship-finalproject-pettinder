import Foundation
import SwiftUI


// gives the reason why the user should allow us to view their location and contains the button that presents the system’s location permission prompt.

struct RequestLocationAccessView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
            VStack {
                Image(systemName: "pawprint.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .foregroundColor(.blue)

                Text("We will use your location to display adoptable pets near you.")
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding(8)
                
                Button {
                    locationManager.requestLocationAccess()
                } label: {
                    Text("Allow Access")
                        .font(.headline)
                        .foregroundColor(Color(.systemBlue))
                }
            }
    }
}

#Preview {
    RequestLocationAccessView()
}

