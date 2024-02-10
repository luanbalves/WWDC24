//
//  ChatView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 10/02/24.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 667, height: 218)
                .clipShape(RoundedCorner(radius: 100, corners: [.topLeft, .bottomLeft]))
                .foregroundStyle(.white)
            
            HStack {
                Text("Bla bla bla bla bla bla bla bla bla bla")
                    .foregroundStyle(.black)
                    .offset(y: -40)
                VStack(spacing: 0) {
                    Circle()
                        .foregroundStyle(.black).opacity(0.6)
                        .frame(width: 131, height: 156)
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 112, height: 32)
                            .foregroundStyle(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        Text("Tr. Asheley")
                            .foregroundStyle(.black)
                    }//: ZSTACK
                    .offset(y: -13)
                }//: VSTACK
                .offset(x: 127)
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
    ChatView()
        .preferredColorScheme(.dark)
}
