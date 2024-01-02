//
//  GamingView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//

import SwiftUI

struct GamingView: View {
    let words = ["Eu", "Estou", "Desenvolvendo"]
       let numberOfColumns = [2, 5, 13]
       var correctAnswers: [String] { words.map { String($0.map { _ in " " }) } }

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
                                       TextField("", text: Binding(
                                           get: {
                                               userAnswers[index]
                                           },
                                           set: { newValue in
                                               let formattedValue = newValue.prefix(1)
                                               userAnswers[index] = String(formattedValue)
                                           }
                                       ))
                                       .multilineTextAlignment(.center)
                                       .frame(width: 30, height: 30)
                                       .overlay(
                                           RoundedRectangle(cornerRadius: 10)
                                               .stroke(Color.black, lineWidth: 1)
                                       )
                                       .keyboardType(.alphabet)
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
               .disabled(currentWordIndex == words.count || showTextField)

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

       func startTimer() {
           Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
               if self.currentWordIndex < self.words.count - 1 {
                   self.currentWordIndex += 1
               } else {
                   timer.invalidate()
                   self.showTextField = true
               }
           }
       }

       func checkAnswer() {
           let correctAnswersCombined = correctAnswers.joined().lowercased()
           let userAnswersCombined = userAnswers.joined().lowercased()

           if userAnswersCombined == correctAnswersCombined {
               feedbackMessage = "Correto!"
           } else {
               feedbackMessage = "Errado!"
           }
       }
   }
#Preview {
    GamingView()
}
