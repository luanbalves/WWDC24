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
               VStack{
                   
                   Text(
                        """
                        Will appear some words in your screen that you have to guard on your mind and then you have to spell them
                        """
                   )
               }//: VSTACK
       }
}

#Preview {
    CreditsView()
}
