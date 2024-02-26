//
//  ChatView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 10/02/24.
//

import SwiftUI

struct ChatView: View {
    let phrase: String

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 667, height: 218)
                .clipShape(RoundedCorner(radius: 100, corners: [.topLeft, .bottomLeft]))
                .foregroundStyle(Colors.Chat.mainColor)
            
            HStack {
                Text(phrase)
                    .foregroundStyle(.black)
//                    .offset(y: -40)
                    .multilineTextAlignment(.center)
                    .frame(width: 400)
                    .padding(.horizontal, 57)
                    .font(.headline)
                VStack(spacing: 0) {
//                    Circle()
//                        .foregroundStyle(.black).opacity(0.6)
//                        .frame(width: 131, height: 156)
                    Image("Image")
                        .resizable()
                        .frame(width: 190, height: 149)
                        .offset(x: -28)
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 112, height: 32)
                            .foregroundStyle(.white)
                            .cornerRadius(17)
                            .overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        Text("Tr. Asheley")
                            .foregroundStyle(.black)
                    }//: ZSTACK
                    .offset(y: -13)
                }//: VSTACK
//                .offset(x: 120)
            }//: HSTACK
        }//: ZSTACK
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension ChatView {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

#Preview {
    ChatView(phrase: "The goal of the game is to help you learn English, using memorization techniques with the most used words in the language, the focus is for you to learn the words necessary to build a linguistic base for conversation, since the 1000 most used words are essential for a conversation to flow.")
        .preferredColorScheme(.dark)
}

//Hi! My name is Asheley, and I'm in college to become a Portuguese/English teacher. My boyfriend always struggled to study English in traditional schools; their methods, focusing on spelling rules, ended up being a hindrance, so he couldn't learn. What helped him was writing key words in both Portuguese and English in his notebooks, and later revisiting those words, thus helping to memorize English and understand their real meaning in the language. I noticed this frequently when I started having practical classes; students would get lost in all the grammar, but advising them to do the same as Luan, they were able to feel a progress in memorization. In this regard, my boyfriend developed a game so that others could try this technique and hopefully help many more people gain access to English.
//
//The goal of the game is to help you learn English, using memorization techniques with the most used words in the language, the focus is for you to learn the words necessary to build a linguistic base for conversation, since the 1000 most used words are essential for a conversation to flow.
//
//6 words will automatically appear every 1 second, you must memorize them, after they all appear the game begins. You will have 60 seconds to fill in the fields with the 6 words.
