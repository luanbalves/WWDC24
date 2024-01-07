//
//  GamingView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//
//    let words = ["simple", "is", "harder", "than", "complex"]
//    let numberOfColumns = [6, 2, 6, 4, 7]

import SwiftUI

struct GamingView: View {
    let words = ["EU", "ESTOU", "DESENVOLVENDO"]
    let numberOfColumns = [2, 5, 13]

    @State private var currentWordIndex = 0
    @State private var feedbackMessage: String? = nil
    @State private var showTextField = false
    @State private var userAnswers: [String] = []

    var body: some View {
        VStack {
            if currentWordIndex < words.count {
                Text(words[currentWordIndex])
                    .font(.title)
                    .padding()
                    .opacity(showTextField ? 0 : 1)
            }

            if showTextField {
                VStack {
                    ForEach(0..<numberOfColumns.count, id: \.self) { colIndex in
                        HStack {
                            ForEach(0..<numberOfColumns[colIndex], id: \.self) { rowIndex in
                                let index = rowIndex + colIndex * numberOfColumns.max()!

                                if index < userAnswers.count {
                                    let isCorrect = isLetterCorrect(wordIndex: colIndex, letterIndex: rowIndex, userAnswer: userAnswers[index])

                                    TextField("", text: $userAnswers[index])
                                        .multilineTextAlignment(.center)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(isCorrect ? Color.green : Color.red, lineWidth: 1)
                                        )
                                        .keyboardType(.alphabet)
                                        .onChange(of: userAnswers[index]) { newValue in
                                            if newValue.count > 1 {
                                                userAnswers[index] = String(newValue.prefix(1))
                                                moveToNextField(index)
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
                .padding()
            }

            Button("Verificar") {
                checkAnswer()
            }
            .padding()
            .disabled(!allFieldsFilled() || !showTextField)

            if let feedbackMessage = feedbackMessage {
                Text(feedbackMessage)
                    .foregroundColor(feedbackMessage == "Correto!" ? .green : .red)
                    .padding()
            }
        }
        .onAppear {
            userAnswers = Array(repeating: "", count: numberOfColumns.max()! * words.count)
            startTimer()
        }
    }

    private func allFieldsFilled() -> Bool {
        for wordIndex in 0..<words.count {
            let startIndex = wordIndex * numberOfColumns.max()!
            let endIndex = startIndex + numberOfColumns[wordIndex]
            if endIndex <= userAnswers.count && !userAnswers[startIndex..<endIndex].allSatisfy({ !$0.isEmpty }) {
                return false
            }
        }
        return true
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.currentWordIndex < self.words.count - 1 {
                self.currentWordIndex += 1
            } else {
                timer.invalidate()
                self.showTextField = true
            }
        }
    }

    private func areAnswersCorrect() -> Bool {
        for wordIndex in 0..<words.count {
            let startIndex = wordIndex * numberOfColumns.max()!
            let endIndex = startIndex + numberOfColumns[wordIndex]
            let userAnswerForWord = userAnswers[startIndex..<endIndex].joined().lowercased()
            let correctAnswerForWord = words[wordIndex].lowercased()

            if userAnswerForWord != correctAnswerForWord {
                return false
            }
        }

        return true
    }

    private func checkAnswer() {
        let isCorrect = areAnswersCorrect()
        feedbackMessage = isCorrect ? "Correto!" : "Errado!"
    }

    private func isLetterCorrect(wordIndex: Int, letterIndex: Int, userAnswer: String) -> Bool {
        let correctWord = words[wordIndex].lowercased()

        if letterIndex < correctWord.count {
            let correctLetter = String(correctWord[correctWord.index(correctWord.startIndex, offsetBy: letterIndex)])
            return userAnswer.lowercased() == correctLetter
        }

        return false
    }

    private func moveToNextField(_ currentIndex: Int) {
        guard currentIndex < userAnswers.count - 1 else { return }
        let nextIndex = currentIndex + 1
        withAnimation {
            userAnswers[nextIndex] = ""
        }
    }
}

struct GamingView_Previews: PreviewProvider {
    static var previews: some View {
        GamingView()
    }
}
