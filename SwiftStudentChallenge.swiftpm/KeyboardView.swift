//
//  KeyboardView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 30/01/24.
//

import SwiftUI

struct KeyboardView: View {
    let rows = [
        ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
        ["Z", "X", "C", "V", "B", "N", "M", "Delete"],
        ["Enter"]
    ]
    var onKeyPress: ((String) -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 8) {
                    ForEach(row, id: \.self) { key in
                        Button(action: {
                            if key == "Delete" {
                                onKeyPress?("Delete")
                            } else {
                                onKeyPress?(key)
                            }                        }) {
                                Text(key)
                                    .font(.title)
                                    .frame(width: key == "Enter" ? 120 : 60, height: 60)
                                    .background(key == "Enter" ? Color.green : Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                    }
                }
            }
        }
        .padding()
    }
    
    func handleButtonPress(_ key: String) {
        // Handle button press
        print("Button pressed: \(key)")
    }
}

#Preview {
    KeyboardView()
}
