//
//  CenterModifier.swift
//  Africa
//
//  Created by Shun Ganas on 8/15/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
