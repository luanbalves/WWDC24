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
    
    @State private var count = 0
    
    @State private var enterPressed = false
    @State private var enterPressed1 = false
    @State private var enterPressed2 = false
    @State private var enterPressed3 = false
    @State private var enterPressed4 = false
    @State private var enterPressed5 = false
    
    @State private var isTipsPressed = false
        
    @StateObject var viewModel = GamingDataModel()
    
    var body: some View {
        //MARK: - MAIN GAME VIEW.
        VStack {
            
            if viewModel.currentWordIndex < viewModel.words.count { // Show the words then start
                Text(viewModel.words[viewModel.currentWordIndex])
                    .fontWeight(.bold)
                    .padding()
                    .opacity(viewModel.showTextField ? 0 : 1)
                    .font(.system(size: 35))
            }

            if viewModel.showTextField { // show textfield when finish showing the words
                Text("Remaining time: \(viewModel.timeRemaining) seconds")

                if viewModel.timeRemaining == 0 {
                    Text("PERDEU!")
                }
                
                Button {
                    isTipsPressed = true
                } label: {
                    Text("Tips")
                }
                
                if isTipsPressed {
                    VStack {
                        
                        Button {
                            isTipsPressed = false
                        } label: {
                            Image(systemName: "x.square")
                        }
                        
                        Text("\(viewModel.translations[viewModel.word.lowercased()]?.uppercased() ?? "No translatation")")
                        Text("\(viewModel.translations[viewModel.word1.lowercased()]?.uppercased() ?? "No translatation")")
                        Text("\(viewModel.translations[viewModel.word2.lowercased()]?.uppercased() ?? "No translatation")")
                        Text("\(viewModel.translations[viewModel.word3.lowercased()]?.uppercased() ?? "No translatation")")
                        Text("\(viewModel.translations[viewModel.word4.lowercased()]?.uppercased() ?? "No translatation")")
                        Text("\(viewModel.translations[viewModel.word5.lowercased()]?.uppercased() ?? "No translatation")")
                    }//: VSTACK
                }
                
                Squares(userAnswers: $userAnswer, wordCount: viewModel.word.count, isLetterCorrect: viewModel.isLetterCorrectForWord, buttonPressed: viewModel.buttonPressed)
                Squares(userAnswers: $userAnswer1, wordCount: viewModel.word1.count, isLetterCorrect: viewModel.isLetterCorrectForWord1, buttonPressed: viewModel.buttonPressed)
                Squares(userAnswers: $userAnswer2, wordCount: viewModel.word2.count, isLetterCorrect: viewModel.isLetterCorrectForWord2, buttonPressed: viewModel.buttonPressed)
                Squares(userAnswers: $userAnswer3, wordCount: viewModel.word3.count, isLetterCorrect: viewModel.isLetterCorrectForWord3, buttonPressed: viewModel.buttonPressed)
                Squares(userAnswers: $userAnswer4, wordCount: viewModel.word4.count, isLetterCorrect: viewModel.isLetterCorrectForWord4, buttonPressed: viewModel.buttonPressed)
                Squares(userAnswers: $userAnswer5, wordCount: viewModel.word5.count, isLetterCorrect: viewModel.isLetterCorrectForWord5, buttonPressed: viewModel.buttonPressed)
                
                //MARK: - KEYBOARD VIEW AND FUNCTIONS.
                KeyboardView(onKeyPress: { key in
                    //MARK: - THE NEXT WORD(LINE) LOGIC
                    // if the user press enter, and the word is filled with a word, then go to next line, the enterpressed is just to not have a loop
                    if key == "Enter" && userAnswer.last != "" && enterPressed == false {
                        count = count + 1
                        enterPressed = true
                        if viewModel.areAllWordsCorrect(userAnswers: userAnswer) {
                            print("Palavra correta")
                        }
                    }
                    if key == "Enter" && userAnswer1.last != "" && enterPressed1 == false {
                        count = count + 1
                        enterPressed1 = true
                        if viewModel.areAllWordsCorrect1(userAnswers: userAnswer1) {
                            print("Palavra correta2")
                        }
                    }
                    if key == "Enter" && userAnswer2.last != "" && enterPressed2 == false {
                        count = count + 1
                        enterPressed2 = true
                    }
                    if key == "Enter" && userAnswer3.last != "" && enterPressed3 == false {
                        count = count + 1
                        enterPressed3 = true
                    }
                    if key == "Enter" && userAnswer4.last != "" && enterPressed4 == false {
                        count = count + 1
                        enterPressed4 = true
                    }
                    if key == "Enter" && userAnswer5.last != "" && enterPressed5 == false {
                        count = count + 1
                        enterPressed5 = true
                        viewModel.buttonPressed.toggle() // Change the color line of the square
                        viewModel.timer?.invalidate()
                    }
                    
                    //MARK: - Fill the text fields and delete logic.
                    if count == 0 {
                        if key == "Delete" {
                            guard let lastNonEmptyFieldIndex = userAnswer.lastIndex(where: { !$0.isEmpty }) else {
                                return
                            }
                            
                            userAnswer[lastNonEmptyFieldIndex] = "" // delete the word in the last field
                        } else {
                            guard let firstEmptyFieldIndex = userAnswer.firstIndex(where: { $0.isEmpty }) else {
                                return
                            }
                            
                            if key != "Enter" { // Just to not put enter in the field
                                userAnswer[firstEmptyFieldIndex] = key // put the word pressed in the field
                            }
                        }
                    }
                    
                    if count == 1 {
                        if key == "Delete" {
                            guard let lastNonEmptyFieldIndex = userAnswer1.lastIndex(where: { !$0.isEmpty }) else {
                                return
                            }
                            
                            userAnswer1[lastNonEmptyFieldIndex] = ""
                        } else {
                            guard let firstEmptyFieldIndex = userAnswer1.firstIndex(where: { $0.isEmpty }) else {
                                return
                            }
                            
                            if key != "Enter" {
                                userAnswer1[firstEmptyFieldIndex] = key
                            }
                        }
                    }
                    
                    if count == 2 {
                        if key == "Delete" {
                            guard let lastNonEmptyFieldIndex = userAnswer2.lastIndex(where: { !$0.isEmpty }) else {
                                return
                            }
                            
                            userAnswer2[lastNonEmptyFieldIndex] = ""
                        } else {
                            guard let firstEmptyFieldIndex = userAnswer2.firstIndex(where: { $0.isEmpty }) else {
                                return
                            }
                            if key != "Enter" {
                                userAnswer2[firstEmptyFieldIndex] = key
                            }
                        }
                    }
                    
                    if count == 3 {
                        if key == "Delete" {
                            guard let lastNonEmptyFieldIndex = userAnswer3.lastIndex(where: { !$0.isEmpty }) else {
                                return
                            }
                            
                            userAnswer3[lastNonEmptyFieldIndex] = ""
                        } else {
                            guard let firstEmptyFieldIndex = userAnswer3.firstIndex(where: { $0.isEmpty }) else {
                                return
                            }
                            
                            if key != "Enter" {
                                userAnswer3[firstEmptyFieldIndex] = key
                            }
                        }
                    }
                    
                    if count == 4 {
                        if key == "Delete" {
                            guard let lastNonEmptyFieldIndex = userAnswer4.lastIndex(where: { !$0.isEmpty }) else {
                                return
                            }
                            
                            userAnswer4[lastNonEmptyFieldIndex] = ""
                        } else {
                            guard let firstEmptyFieldIndex = userAnswer4.firstIndex(where: { $0.isEmpty }) else {
                                return
                            }
                            
                            if key != "Enter" {
                                userAnswer4[firstEmptyFieldIndex] = key
                            }
                        }
                    }
                    
                    if count == 5 {
                        if key == "Delete" {
                            guard let lastNonEmptyFieldIndex = userAnswer5.lastIndex(where: { !$0.isEmpty }) else {
                                return
                            }
                            
                            userAnswer5[lastNonEmptyFieldIndex] = ""
                        } else {
                            guard let firstEmptyFieldIndex = userAnswer5.firstIndex(where: { $0.isEmpty }) else {
                                return
                            }
                            
                            if key != "Enter" {
                                userAnswer5[firstEmptyFieldIndex] = key
                            }
                        }
                    }
                    
                }) //: KEYBOARD
                .disabled(disableKeyboard)
                .opacity(disableKeyboard ? 0.5 : 1)

            }
        }//: VSTACK
        .onAppear {
            viewModel.startTimer() // calls functions to show the words
            viewModel.startTimerView()
        }
    }
}

extension GamingView {
    var disableKeyboard: Bool {
        if viewModel.timeRemaining == 0 || enterPressed5 {
            return true
        }
        return false
    }
}

//#Preview {
//    GamingView(userAnswer: "...", userAnswer1: "...", userAnswer2: "...", userAnswer3: "...", userAnswer4: "...", userAnswer5: "...")
//}
