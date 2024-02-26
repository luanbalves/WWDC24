//
//  HelpView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//

import SwiftUI

struct CreditsView: View {
    @Environment(\.dismiss) var dismiss
       
       public var body: some View {
           VStack {
                   
                   VStack {
                       Text("Font (title of the game and icon):")
                       Text("https://www.fontspace.com/bark-type-font-f109239")
                           .underline()
                           .foregroundStyle(.blue)
                   }
                   .multilineTextAlignment(.center)

                   
                   VStack {
                       Text("Vowels image:")
                       Text("https://www.freepik.com/free-vector/collection-letters-with-animals_5425998.htm#query=animal%20fonts&position=4&from_view=keyword&track=ais&uuid=418bfdbc-d9e4-4c2d-962a-7055184d0f19")
                           .underline()
                           .foregroundStyle(.blue)
                   }
                   .multilineTextAlignment(.center)
                   
                   VStack {
                       Text("Music1:")
                       Text("https://pixabay.com/sound-effects/game-bonus-144751/")
                           .underline()
                           .foregroundStyle(.blue)
                   }
                   .multilineTextAlignment(.center)

                   VStack {
                       Text("Music2:")
                       Text("https://pixabay.com/sound-effects/bel-sekolah-153453/")
                           .underline()
                           .foregroundStyle(.blue)
                   }
                   .multilineTextAlignment(.center)

                   VStack {
                       Text("Music3:")
                       Text("https://pixabay.com/music/happy-childrens-tunes-life-of-a-wandering-wizard-15549/")
                           .underline()
                           .foregroundStyle(.blue)
                   }
                   .multilineTextAlignment(.center)

                   VStack {
                       Text("Music4:")
                       Text("https://pixabay.com/music/beautiful-plays-playing-in-color-120336/")
                           .underline()
                           .foregroundStyle(.blue)
                   }
                   .multilineTextAlignment(.center)

               }//: VSTACK
       }
}

#Preview {
    CreditsView()
}
