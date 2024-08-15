//
//  CreditsView.swift
//  Africa
//
//  Created by Shun Ganas on 8/15/24.
//

import SwiftUI

struct CreditsView: View {
    
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128,
                       height: 128)
            Text("""
    Copyright © Bestguy360
    All rights reserved
    Best There Is ❤️
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
        .previewLayout(.sizeThatFits)
        .padding()
}
