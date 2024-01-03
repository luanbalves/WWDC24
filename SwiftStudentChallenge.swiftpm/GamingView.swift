//
//  GamingView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//

import SwiftUI

struct GamingView: View {
    let words = ["EU", "ESTOU", "DESENVOLVENDO"]
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
                                    TextView(bindingText: $userAnswers[index], onEditingChanged: { _ in })
                                        .multilineTextAlignment(.center)
                                        .frame(width: 30, height: 30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 1)
                                        )
                                        .keyboardType(.alphabet)
                                        .onReceive(NotificationCenter.default.publisher(for: UITextView.textDidChangeNotification)) { _ in
                                            // Garante que apenas uma letra é permitida
                                            if userAnswers[index].count > 1 {
                                                userAnswers[index] = String(userAnswers[index].prefix(1))
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

}

class Coordinator: NSObject, UITextFieldDelegate {
    var parent: TextView

    init(_ parent: TextView) {
        self.parent = parent
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacterSet = CharacterSet.letters

        if string.isEmpty {
            let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            parent.bindingText = newText
        } else if string.count == 1, let newCharacter = string.first,
            newCharacter.unicodeScalars.allSatisfy({ allowedCharacterSet.contains($0) }) {
            let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            if newText.count == 1 {
                parent.bindingText = newText
                focusNextTextField(after: textField)
            }
        }

        return false
    }

    func focusNextTextField(after textField: UITextField) {
        guard let parentView = textField.superview,
              let nextTextField = parentView.viewWithTag(textField.tag + 1) as? UITextField else {
            return
        }

        nextTextField.becomeFirstResponder()
    }


    func textFieldDidBeginEditing(_ textField: UITextField) {
        parent.onEditingChanged(true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        parent.onEditingChanged(false)
    }
}

struct TextView: UIViewRepresentable {
    @Binding var bindingText: String
    var onEditingChanged: (Bool) -> Void

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.tag = context.coordinator.parent.bindingText.count  // Adiciona uma tag única para cada text field
        textField.textAlignment = .center
        return textField
    }


    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = bindingText
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

#Preview {
    GamingView()
}
