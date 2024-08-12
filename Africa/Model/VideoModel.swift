//
//  VideoModel.swift
//  Africa
//
//  Created by Shun Ganas on 7/11/24.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
