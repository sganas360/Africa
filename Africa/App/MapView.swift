//
//  MapView.swift
//  Africa
//
//  Created by Shun Ganas on 6/26/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286,
                                                    longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0,
                                            longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates,
                                           span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
//        Map(coordinateRegion: $region)
        Map(coordinateRegion: $region,
            annotationItems: locations,
            annotationContent: { item in
            // (A) PIN: OLD STYLE (always static)
//            MapPin(coordinate: item.location, 
//                   tint: .accentColor)
            
            // (B) MARKER: NEW STYLE (always static)
//            MapMarker(coordinate: item.location,
//                      tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }
            
            // (D) CUSTOM ADVANACED ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })
        .overlay(
            HStack(alignment: .center,
                   spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                       
                VStack(alignment: .leading, spacing: 3)  {
                    HStack {
                        Text("Latitude:")
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .foregroundColor(.white)
                    }
                    .font(.footnote)
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .foregroundColor(.white)
                    }
                    .font(.footnote)
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding(),
            alignment: .top)
    }
}

#Preview {
    MapView()
}
