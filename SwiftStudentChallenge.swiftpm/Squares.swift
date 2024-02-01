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
    
    var body: some View {
        HStack {
            ForEach(0..<wordCount, id: \.self) { index in
                if index < userAnswers.count {
                        TextField("", text: $userAnswers[index])
                            .multilineTextAlignment(.center)
                            .frame(width: 50, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 1)
                            )
                    } else {
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
