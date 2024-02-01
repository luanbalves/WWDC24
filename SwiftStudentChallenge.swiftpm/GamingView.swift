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
    
    var body: some View {
        VStack {
            Squares(userAnswers: $userAnswer, wordCount: 6)
            Squares(userAnswers: $userAnswer1, wordCount: 3)
            Squares(userAnswers: $userAnswer2, wordCount: 2)
            Squares(userAnswers: $userAnswer3, wordCount: 6)
            Squares(userAnswers: $userAnswer4, wordCount: 4)
            Squares(userAnswers: $userAnswer5, wordCount: 7)
            
        }//: VSTACK
        
        KeyboardView(onKeyPress: { key in
            
            if key == "Enter" && userAnswer.last != "" && enterPressed == false {
                count = count + 1
                enterPressed = true
            }
            if key == "Enter" && userAnswer1.last != "" && enterPressed1 == false {
                count = count + 1
                enterPressed1 = true
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
            }
            
            if count == 0 {
                if key == "Delete" {
                    guard let lastNonEmptyFieldIndex = userAnswer.lastIndex(where: { !$0.isEmpty }) else {
                        return
                    }
                    
                    userAnswer[lastNonEmptyFieldIndex] = ""
                } else {
                    guard let firstEmptyFieldIndex = userAnswer.firstIndex(where: { $0.isEmpty }) else {
                        return
                    }
                    
                    if key != "Enter" {
                        userAnswer[firstEmptyFieldIndex] = key
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
            
        })
    }
}

//#Preview {
//    GamingView(userAnswer: "...", userAnswer1: "...", userAnswer2: "...", userAnswer3: "...", userAnswer4: "...", userAnswer5: "...")
//}
