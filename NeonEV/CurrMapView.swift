//
//  CurrMapView.swift
//  NeonEV
//
//  Created by Shivoy Arora on 04/02/23.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var tint: Color
}

struct CurrMapView: View {
    @StateObject var manager = LocationManager()
    @State var tracking: MapUserTrackingMode = .follow
    @State var ac = true
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack {
            
            // Background
            Color(red: 21/255, green: 39/255, blue: 49/255)
                .ignoresSafeArea()
            
            
            VStack {
                // Top bar
                HStack{
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Text("NeonEV")
                        .foregroundColor(.cyan)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Logout")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding([.trailing, .leading, .top])
                
                
                Map(
                    coordinateRegion: $manager.region,
                    interactionModes: MapInteractionModes.all,
                    showsUserLocation: true,
                    annotationItems: ac ? ac_places : dc_places,
                    annotationContent: {
                        MapMarker(coordinate: $0.coordinate, tint: $0.tint)
                    }
                )
                .padding()
                
            }
            
            
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.white)
                .frame(width: 120, height: 50)
                .padding()
                .overlay {
                    HStack {
                        Button{
                            ac = true
                        }label: {
                            Text("AC")
                                .foregroundColor(.red)
                                .padding()
                        }
                        Divider()
                        
                        Button{
                            ac = false
                        }label: {
                            Text("DC")
                                .foregroundColor(.green)
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding()
        }
    }
    
    
    let ac_places = [
        AnnotatedItem(coordinate: .init(latitude: 28.47011, longitude: 77.22691), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.548995, longitude: 77.566583), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.521189, longitude: 28.611189), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.488991, longitude: 77.66324), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.549427, longitude: 77.544636), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.410291, longitude: 77.901653), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.4224856, longitude: 77.4392318), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.544785, longitude: 77.1421549), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.55476, longitude: 77.2481831), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.54553, longitude: 77.508831), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.57471, longitude: 77.45247), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.68573, longitude: 77.563024), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.65553, longitude: 77.842979), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.64553, longitude: 77.245979), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.64415, longitude: 77.243935), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.6405745, longitude: 77.34532531), tint: .blue),
        AnnotatedItem(coordinate: .init(latitude: 28.6865847, longitude: 77.8532531), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.61107, longitude: 77.50765), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.62277, longitude: 77.540765), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.55969, longitude: 77.30033), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.63775, longitude: 77.232313), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.67422, longitude: 77.57813), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.65451, longitude: 77.78513), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.61116, longitude: 77.34213), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.45456, longitude: 77.630447), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.76236, longitude: 77.081463), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.64538, longitude: 77.490636), tint: .blue),
        AnnotatedItem(coordinate: .init(latitude: 28.61174, longitude: 77.540263), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.91158, longitude: 77.680801), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.33246, longitude: 77.200828), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.7572, longitude: 77.380828), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.71123, longitude: 77.392879), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.42866, longitude: 77.520716), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.73883366, longitude: 7700716), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.5360962, longitude: 77.2231022), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.45572, longitude: 77.1120828), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.72123, longitude: 77.342879), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.24866, longitude: 77.910716), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.02883366, longitude: 77.600716), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.3560962, longitude: 77.4231022), tint: .red),
        AnnotatedItem(coordinate: .init(latitude: 28.642607, longitude: 77.38765), tint: .blue),
        AnnotatedItem(coordinate: .init(latitude: 28.36446, longitude: 77.18828), tint: .blue),
    ]
    
    let dc_places = [
        AnnotatedItem(coordinate: .init(latitude: 28.6405745, longitude: 77.34532531), tint: .blue),
        AnnotatedItem(coordinate: .init(latitude: 28.64538, longitude: 77.490636), tint: .blue),
        AnnotatedItem(coordinate: .init(latitude: 28.3482338, longitude: 77.611666), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.441695, longitude: 77.367583), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.4341389, longitude: 28.474189), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.3488491, longitude: 77.51324), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.099627, longitude: 77.658636), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.450891, longitude: 77.772653), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.3526856, longitude: 77.6898318), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.3454985, longitude: 77.829449), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.7255276, longitude: 77.24831), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.096753, longitude: 77.38831), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.1871, longitude: 77.786247), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.46173, longitude: 77.568024), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.36653, longitude: 77.34979), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.398053, longitude: 77.568979), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.326515, longitude: 77.321935), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.23605145, longitude: 77.94539531), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.3965347, longitude: 77.8433531), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.642607, longitude: 77.38765), tint: .blue),
        AnnotatedItem(coordinate: .init(latitude: 28.436177, longitude: 77.612765), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.325569, longitude: 77.505033), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.3476175, longitude: 77.2373), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.46322, longitude: 77.9143), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.346951, longitude: 77.8043), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.661216, longitude: 77.7173), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.914856, longitude: 77.2447), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.127836, longitude: 77.38463), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.326838, longitude: 77.12636), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.36874, longitude: 77.48263), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.66158, longitude: 77.55801), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.36446, longitude: 77.18828), tint: .blue),
        AnnotatedItem(coordinate: .init(latitude: 28.06972, longitude: 77.19828), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.67523, longitude: 77.33879), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.44166, longitude: 77.45716), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.15888366, longitude: 77.345716), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.0367962, longitude: 77.4581022), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.326446, longitude: 77.311828), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.26972, longitude: 77.459828), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.427523, longitude: 77.353879), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.614166, longitude: 77.125716), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.365888366, longitude: 77.445716), tint: .green),
        AnnotatedItem(coordinate: .init(latitude: 28.9867962, longitude: 77.5581022), tint: .green)
    ]
}

struct CurrMapView_Previews: PreviewProvider {
    static var previews: some View {
        CurrMapView()
    }
}
