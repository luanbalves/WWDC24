//
//  AudioLoader.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 25/02/24.
//

import AVFoundation

class AudioLoader {
    static func load(filename: String, fileType: String) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileType) else {
            fatalError("Audio \(filename) not found!")
        }
        
        do {
            let audio = try AVAudioPlayer(contentsOf: url)
            audio.prepareToPlay()
            return audio
        } catch {
            print("Error loading audio: \(error)")
            return nil
        }
    }
}
