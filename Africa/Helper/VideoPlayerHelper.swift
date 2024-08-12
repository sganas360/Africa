//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Shun Ganas on 8/12/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
            videoPlayer = AVPlayer(url: url)
            videoPlayer?.play()
        }
    }
    return videoPlayer
}
