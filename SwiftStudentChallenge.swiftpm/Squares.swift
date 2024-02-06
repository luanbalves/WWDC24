//
//  Squares.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 31/01/24.
//

import SwiftUI

struct Squares: View {
    @Binding var userAnswers: [String]
        let wordCount: Int
        let isLetterCorrect: (Character, Int) -> Bool
        let buttonPressed: Bool

        var body: some View {
            HStack {
                ForEach(0..<wordCount, id: \.self) { index in
                    if index < userAnswers.count {
                        let userLetter = userAnswers[index].isEmpty ? " " : userAnswers[index].first!
                        let isCorrect = isLetterCorrect(userLetter, index)

                        TextField("", text: $userAnswers[index])
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .frame(width: 60, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(!isCorrect ? (buttonPressed ? Color.red : Color.gray) : (buttonPressed ? Color.green : Color.gray), lineWidth: 3)
                            )
                            .disabled(true)
                    }
                }
            }
            .onAppear {
                userAnswers = Array(repeating: "", count: wordCount)
            }
    }
}

//#Preview {
//    Squares(userAnswers: .constant("lalala"), wordCount: 1)
//}
