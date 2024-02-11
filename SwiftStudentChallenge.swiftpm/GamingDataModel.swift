//
//  GamingDataModel.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//

import SwiftUI

class GamingDataModel: ObservableObject {
    
    var word = "SIMPLE"
    var word1 = "CAN"
    var word2 = "BE"
    var word3 = "HARDER"
    var word4 = "THAN"
    var word5 = "COMPLEX"
    
    let translations: [String: String] = [
        "simple" : "SIMPLES",
        "harder" : "MAIS DIFÍCIL",
        "complex" : "COMPLEXO",
        "the": "o/a(s)/as",
        "be": "ser/estar",
        "to": "para/a",
        "of": "de",
        "and": "e",
        "a": "um/uma",
        "in": "em",
        "that": "esse(a)/aquele(a)",
        "have": "ter",
        "i": "eu",
        "it": "isso/ele(a)",
        "for": "para/por",
        "not": "não",
        "on": "sobre/em",
        "with": "com",
        "he": "ele",
        "as": "como",
        "you": "você",
        "do": "fazer",
        "at": "em/a",
        "this": "este(a)",
        "but": "mas",
        "his": "dele",
        "by": "por",
        "from": "de",
        "they": "eles(as)",
        "we": "nós",
        "say": "dizer",
        "her": "ela",
        "she": "ela",
        "or": "ou",
        "an": "um/uma",
        "will": "vai",
        "my": "meu/minha",
        "one": "um/uma",
        "all": "todo/toda",
        "would": "iria",
        "there": "lá",
        "their": "deles(as)",
        "what": "o que",
        "so": "então",
        "up": "acima",
        "out": "fora",
        "if": "se",
        "about": "sobre",
        "who": "quem",
        "get": "obter",
        "which": "qual",
        "go": "ir",
        "me": "me",
        "when": "quando",
        "make": "fazer",
        "can": "poder",
        "like": "gostar",
        "time": "tempo",
        "no": "não",
        "just": "apenas",
        "him": "ele",
        "know": "saber/conhecer",
        "take": "levar/pegar",
        "people": "pessoas",
        "into": "dentro",
        "year": "ano",
        "your": "seu/sua",
        "good": "bom/bem",
        "some": "algum(s)/alguma(s)",
        "could": "poderia",
        "them": "eles(as)",
        "see": "ver",
        "other": "outro(s)/outra(s)",
        "than": "do que",
        "then": "então",
        "now": "agora",
        "look": "olhar",
        "only": "apenas/só",
        "come": "vir/venir",
        "its": "seu/sua (referindo-se a objeto/animal)",
        "over": "sobre",
        "think": "pensar",
        "also": "também",
        "back": "de volta",
        "after": "depois/depois de",
        "use": "usar",
        "two": "dois/duas",
        "how": "como",
        "our": "nosso/nossa",
        "work": "trabalho",
        "first": "primeiro(a)",
        "well": "bem",
        "way": "caminho/forma",
        "even": "mesmo/até",
        "new": "novo(s)/nova(s)",
        "want": "querer",
        "because": "porque",
        "any": "qualquer",
        "these": "estes(as)/essas(es)",
        "give": "dar",
        "day": "dia",
        "most": "mais",
        "us": "nós",
    ]
    
    let mostUsedWords = [
        "the", "be", "to", "of", "and", "a", "in", "that", "have", "I",
        "it", "for", "not", "on", "with", "he", "as", "you", "do", "at",
        "this", "but", "his", "by", "from", "they", "we", "say", "her", "she",
        "or", "an", "will", "my", "one", "all", "would", "there", "their", "what",
        "so", "up", "out", "if", "about", "who", "get", "which", "go", "me",
        "when", "make", "can", "like", "time", "no", "just", "him", "know", "take",
        "people", "into", "year", "your", "good", "some", "could", "them", "see", "other",
        "than", "then", "now", "look", "only", "come", "its", "over", "think", "also",
        "back", "after", "use", "two", "how", "our", "work", "first", "well", "way",
        "even", "new", "want", "because", "any", "these", "give", "day", "most", "us"
    ]
    
    @Published var currentWordIndex = 0
    
    @Published var words: [String] = []
    @Published var buttonPressed = false
    @Published var showTextField = false
    
    @Published var timeRemaining = 65
    @Published var timer: Timer?
    @AppStorage("selectedGameOption") var selectedGameOption = 0
    
    init () {
        updateWords()
    }
    
    func updateWords() { // Update words case 100 most used words
        let randomWord = mostUsedWords.randomElement() ?? ""
        let randomWord1 = mostUsedWords.randomElement() ?? ""
        let randomWord2 = mostUsedWords.randomElement() ?? ""
        let randomWord3 = mostUsedWords.randomElement() ?? ""
        let randomWord4 = mostUsedWords.randomElement() ?? ""
        let randomWord5 = mostUsedWords.randomElement() ?? ""
        
        if selectedGameOption == 1 {
            word = randomWord.uppercased()
            word1 = randomWord1.uppercased()
            word2 = randomWord2.uppercased()
            word3 = randomWord3.uppercased()
            word4 = randomWord4.uppercased()
            word5 = randomWord5.uppercased()
        }
    }
    
    //MARK: - LETTERS CORRECT
    func isLetterCorrect(userLetter: Character, atIndex index: Int, word: String) -> Bool {
        guard index < word.count else {
            return false
        }
        
        let correctWord = word.lowercased()
        let correctLetter = correctWord[correctWord.index(correctWord.startIndex, offsetBy: index)]
        
        return userLetter.lowercased() == correctLetter.lowercased()
    }
    
    func isLetterCorrectForWord(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word)
    }
    
    func isLetterCorrectForWord1(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word1)
    }
    
    func isLetterCorrectForWord2(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word2)
    }
    func isLetterCorrectForWord3(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word3)
    }
    
    func isLetterCorrectForWord4(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word4)
    }
    func isLetterCorrectForWord5(userLetter: Character, atIndex index: Int) -> Bool {
        return isLetterCorrect(userLetter: userLetter, atIndex: index, word: word5)
    }
    
    //MARK: - CORRECT WORDS
    func areAllWordsCorrect(userAnswers: [String]) -> Bool {
        guard userAnswers.count == word.count else {
            return false
        }
        
        return userAnswers.elementsEqual(word.map { $0.uppercased() })
    }
    
    func areAllWordsCorrect1(userAnswers: [String]) -> Bool {
        guard userAnswers.count == word1.count else {
            return false
        }
        
        return userAnswers.elementsEqual(word1.map { $0.uppercased() })
    }
    
    func areAllWordsCorrectAll(userAnswers: [String], userAnswers1: [String], userAnswers2: [String], userAnswers3: [String], userAnswers4: [String], userAnswers5: [String]) -> Bool {
        guard userAnswers.count == word.count else {
            return false
        }
        
        guard userAnswers1.count == word1.count else {
            return false
        }
        
        guard userAnswers2.count == word2.count else {
            return false
        }
        
        guard userAnswers3.count == word3.count else {
            return false
        }
        
        guard userAnswers4.count == word4.count else {
            return false
        }
        
        guard userAnswers5.count == word5.count else {
            return false
        }
        
        return userAnswers.elementsEqual(word.map { $0.uppercased() }) &&
        userAnswers1.elementsEqual(word1.map { $0.uppercased() }) &&
        userAnswers2.elementsEqual(word2.map { $0.uppercased() }) &&
        userAnswers3.elementsEqual(word3.map { $0.uppercased() }) &&
        userAnswers4.elementsEqual(word4.map { $0.uppercased() }) &&
        userAnswers5.elementsEqual(word5.map { $0.uppercased() })
    }
    
    //MARK: - TIMER TO SHOW THE WORDS WHEN START
    func startTimer() {
        words = [word, word1, word2, word3, word4, word5]
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.currentWordIndex < self.words.count - 1 {
                self.currentWordIndex += 1
            } else {
                timer.invalidate()
                self.showTextField = true
            }
        }
    }
    
    //MARK: - TIMER TO END THE GAME
    func startTimerView() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
            }
        }
    }
}






