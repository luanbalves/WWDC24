//
//  HelpView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 02/01/24.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
       
       public var body: some View {
           NavigationStack {
               VStack{
                   
                   Text(
                        """
                        Will appear some words in your screen that you have to guard on your mind and then you have to spell them
                        """
                   )
               }//: VSTACK
               .navigationTitle("How to play")
               .navigationBarTitleDisplayMode(.inline)
               .toolbar {
                   ToolbarItem(placement: .topBarTrailing) {
                       Button(action: {
                           dismiss()
                       }, label: {
                           Image(systemName: "xmark.app")
                               .foregroundStyle(Color.primary)
                       })
                   }
               }
           }//: NAVSTACK
       }
}

#Preview {
    HelpView()
}
