import SwiftUI

struct ContentView: View {
    @State private var isShowingHelp = false
    let gameOptions = ["SSC", "1000 MOST USED WORDS", "ALL"]
    @State var selectedLanguageOption = 0
    let languageOptions = ["English", "Portuguese", "Spanish"]
    @StateObject var viewModel = GamingDataModel()

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
                Picker("Options:", selection: $viewModel.selectedGameOption) {
                    Text(gameOptions[0]).tag(0)
                    Text(gameOptions[1]).tag(1)
                    Text(gameOptions[2]).tag(2)
                }
                
                NavigationLink(destination: GamingView(userAnswer: [""], userAnswer1: [""], userAnswer2: [""], userAnswer3: [""], userAnswer4: [""], userAnswer5: [""])) {
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
