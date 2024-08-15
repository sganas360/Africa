//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Shun Ganas on 8/15/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return AnimalGridItemView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
