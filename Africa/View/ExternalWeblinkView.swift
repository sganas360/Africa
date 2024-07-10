//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Shun Ganas on 7/10/24.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Link(animal.name, destination: (URL(string: animal.link)
                                                    ?? URL(string: "https://wikipedia.org"))!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return ExternalWeblinkView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
