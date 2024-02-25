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
    ChatView(phrase: "You're on fire! Keep up the great work!. The words were: SIMPLE, CAN, BE, HARDER, THAN, COMPLEX.")
        .preferredColorScheme(.dark)
}
