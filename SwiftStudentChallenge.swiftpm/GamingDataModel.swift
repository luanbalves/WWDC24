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
    
    //MARK: - LETTERS CORRECT
    func isLetterCorrect(userLetter: Character, atIndex index: Int, word: String) -> Bool {
        guard index < word.count else {
            return false
        }

        let correctWord = word.lowercased()
        let correctLetter = correctWord[correctWord.index(correctWord.startIndex, offsetBy: index)]

        return userLetter.lowercased() == correctLetter.lowercased()
    }

    func isLetterCorrectForWord(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word)
    }
    
    func isLetterCorrectForWord1(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word1)
    }

    func isLetterCorrectForWord2(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word2)
    }
    func isLetterCorrectForWord3(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word3)
    }

    func isLetterCorrectForWord4(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word4)
    }
    func isLetterCorrectForWord5(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word5)
    }

    //MARK: - CORRECT WORDS
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

