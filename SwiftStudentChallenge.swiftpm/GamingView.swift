//
//  GamingView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//
//    let words = ["simple", "can", "be", "harder", "than", "complex"]
//    let numberOfColumns = [6, 3, 2, 6, 4, 7]

import SwiftUI

struct GamingView: View {
    @State var userAnswer: [String]
    @State var userAnswer1: [String]
    @State var userAnswer2: [String]
    @State var userAnswer3: [String]
    @State var userAnswer4: [String]
    @State var userAnswer5: [String]

    var body: some View {
        VStack {
            Squares(userAnswers: $userAnswer, wordCount: 6)
            Squares(userAnswers: $userAnswer1, wordCount: 3)
            Squares(userAnswers: $userAnswer2, wordCount: 2)
            Squares(userAnswers: $userAnswer3, wordCount: 6)
            Squares(userAnswers: $userAnswer4, wordCount: 4)
            Squares(userAnswers: $userAnswer5, wordCount: 7)
            
        }
    }
}

//#Preview {
//    GamingView(userAnswer: "...", userAnswer1: "...", userAnswer2: "...", userAnswer3: "...", userAnswer4: "...", userAnswer5: "...")
//}
