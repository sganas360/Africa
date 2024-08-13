//
//  GalleryView.swift
//  Africa
//
//  Created by Shun Ganas on 6/26/24.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // Simple grid definition
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    // Efficient grid definition
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), 
//                                       count: 3)
    
    // Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()),
                           count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,
                                             lineWidth: 8))
                
                Slider(value: $gridColumn, 
                       in: 2...4,
                       step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })

                LazyVGrid(columns: gridLayout,
                          alignment: .center,
                          spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(Color.white,
                                        lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
