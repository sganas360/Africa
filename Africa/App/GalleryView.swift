//
//  GalleryView.swift
//  Africa
//
//  Created by Shun Ganas on 6/26/24.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
