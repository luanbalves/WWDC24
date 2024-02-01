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
            
        }//: VSTACK
        .onAppear {
            userAnswer = Array(repeating: "", count: 6)
            userAnswer1 = Array(repeating: "", count: 3)
            userAnswer2 = Array(repeating: "", count: 2)
            userAnswer3 = Array(repeating: "", count: 6)
            userAnswer4 = Array(repeating: "", count: 4)
            userAnswer5 = Array(repeating: "", count: 7)
        }
        
        KeyboardView(onKeyPress: { key in
                            if key == "Delete" {
                                guard let lastNonEmptyFieldIndex = userAnswer.lastIndex(where: { !$0.isEmpty }) else {
                                    return
                                }

                                userAnswer[lastNonEmptyFieldIndex] = ""
                            } else {
                                guard let firstEmptyFieldIndex = userAnswer.firstIndex(where: { $0.isEmpty }) else {
                                    return
                                }

                                userAnswer[firstEmptyFieldIndex] = key
                            }
                        })
    }
}

//#Preview {
//    GamingView(userAnswer: "...", userAnswer1: "...", userAnswer2: "...", userAnswer3: "...", userAnswer4: "...", userAnswer5: "...")
//}
