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
    @StateObject var viewModel = GamingDataModel()
    
    var body: some View {
        HStack {
            ForEach(0..<wordCount, id: \.self) { index in
                if index < userAnswers.count {
                    let userLetter = userAnswers[index].isEmpty ? " " : userAnswers[index].first!
                    let isCorrect = viewModel.isLetterCorrect(userLetter: userLetter, atIndex: index)
                        TextField("", text: $userAnswers[index])
                            .multilineTextAlignment(.center)
                            .frame(width: 50, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(!isCorrect ? Color.red : Color.green, lineWidth: 2)
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
