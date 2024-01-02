//
//  GamingView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//

import SwiftUI

struct GamingView: View {
    let words = ["Eu", "Estou", "Desenvolvendo"]
    
    @State private var currentWordIndex = 0
    var body: some View {
        VStack {
            Text(words[currentWordIndex])
                .font(.title)
                .padding()
                .onAppear {
                    startTimer()
                }
        }
    }
    
    func startTimer() {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                if self.currentWordIndex < self.words.count - 1 {
                    self.currentWordIndex += 1
                } else {
                    timer.invalidate()
                }
            }
        }
}



#Preview {
    GamingView()
}
