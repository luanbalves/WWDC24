import SwiftUI

struct ContentView: View {
    @State private var isShowingHelp = false
    @State private var selectedGameOption = 0
    let gameOptions = ["1000 MOST USED WORDS", "2000 MOST USED WORDS", "ALL"]
    @State private var selectedLanguageOption = 0
    let languageOptions = ["English", "Portuguese", "Spanish"]
    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Select the language:")
                    .padding(.bottom, -10)
                Picker("Options:", selection: $selectedLanguageOption) {
                    Text(languageOptions[0]).tag(0)
                    Text(languageOptions[1]).tag(1)
                    Text(languageOptions[2]).tag(2)
                }
                
                Text("Select the game mode:")
                    .padding(.bottom, -10)
                Picker("Options:", selection: $selectedGameOption) {
                    Text(gameOptions[0]).tag(0)
                    Text(gameOptions[1]).tag(1)
                    Text(gameOptions[2]).tag(2)
                }
//                .background(Color.cyan)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                NavigationLink(destination: GamingView()) {
                    HStack(spacing: 5){
                        Image(systemName: "play.circle")
                        Text("START")
                    }
                    .fontWeight(.semibold)
                    .frame(width:100, height: 52)
                }
                .buttonStyle(PlainButtonStyle())
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }//: VSTACK
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        isShowingHelp.toggle()
                    }, label: {
                        Image(systemName: "questionmark.circle")
                    })
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Título".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .background(
                            Color.primary
                                .frame(height: 6)
                                .offset(y: 24)
                        )
                }
            }
            .sheet(isPresented: $isShowingHelp, content: {
                HelpView()
            })
        }//: NAVSTACK
    }
}
