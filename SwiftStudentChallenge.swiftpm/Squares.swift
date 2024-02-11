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
                            .background(Colors.SquaresColors.mainColor)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.25), radius: 0, x: 0, y: 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(!isCorrect ? (buttonPressed ? Color.red : Colors.SquaresColors.stroke) : (buttonPressed ? Color.green : Colors.SquaresColors.stroke), lineWidth: 3)
                            )
                            .disabled(true)
//                            .shadow(color: Color.black.opacity(0.25), radius: 3, x: 0, y: 8)
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
