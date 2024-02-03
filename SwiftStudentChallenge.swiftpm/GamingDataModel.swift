//
//  GamingDataModel.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//

import SwiftUI

class GamingDataModel: ObservableObject {
    let word = "SIMPLE"
    let word1 = "CAN"
    let word2 = "BE"
    let word3 = "HARDER"
    let word4 = "THAN"
    let word5 = "COMPLEX"
    
    func isLetterCorrect(letterIndex: Int, userAnswer: String) -> Bool {
        guard letterIndex < word.count else {
            return false
        }

        let correctWord = word.lowercased()

        let userLetter = String(userAnswer[userAnswer.index(userAnswer.startIndex, offsetBy: word.count)])

        return userLetter.lowercased() == String(correctWord[correctWord.index(correctWord.startIndex, offsetBy: letterIndex)])
    }
    
    func areAllWordsCorrect(userAnswers: [String]) -> Bool {
        guard userAnswers.count == word.count else {
            return false
        }

        return userAnswers.elementsEqual(word.map { $0.uppercased() })
    }
    
    func areAllWordsCorrect1(userAnswers: [String]) -> Bool {
        guard userAnswers.count == word1.count else {
            return false
        }

        return userAnswers.elementsEqual(word1.map { $0.uppercased() })
    }
}



//    private func startTimer() {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            if self.currentWordIndex < self.words.count - 1 {
//                self.currentWordIndex += 1
//            } else {
//                timer.invalidate()
//                self.showTextField = true
//            }
//        }
//    }
//
//    private func areAnswersCorrect() -> Bool {
//        for wordIndex in 0..<words.count {
//            let startIndex = wordIndex * numberOfColumns.max()!
//            let endIndex = startIndex + numberOfColumns[wordIndex]
//            let userAnswerForWord = userAnswers[startIndex..<endIndex].joined().lowercased()
//            let correctAnswerForWord = words[wordIndex].lowercased()
//
//            if userAnswerForWord != correctAnswerForWord {
//                return false
//            }
//        }
//
//        return true
//    }
//
//    private func checkAnswer() {
//        let isCorrect = areAnswersCorrect()
//        feedbackMessage = isCorrect ? "Correto!" : "Errado!"
//    }

