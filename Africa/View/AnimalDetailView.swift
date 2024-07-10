//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Shun Ganas on 6/27/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20){
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled",
                                headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                Group {
                    HeadingView(headingImage: "questionmark.circle",
                                headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                Group {
                    HeadingView(headingImage: "info.circle",
                                headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                Group {
                    HeadingView(headingImage: "map",
                                headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                Group {
                    HeadingView(headingImage: "books.vertical",
                                headingText: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
                
            }
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return NavigationView {
        AnimalDetailView(animal: animals[1])
    }
    .previewDevice("iPhone 11 Pro")
    
}
