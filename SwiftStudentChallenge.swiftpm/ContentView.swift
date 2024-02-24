import SwiftUI

struct ContentView: View {
    @State private var isShowingHelp = false
    let gameOptions = ["SSC", "1000 MOST USED WORDS"]
    @State var selectedLanguageOption = 0
    let languageOptions = ["ENGLISH"]
    @StateObject var viewModel = GamingDataModel()

    var body: some View {
        NavigationStack{
            ZStack {
                Colors.Background.mainColor
                    .ignoresSafeArea(.all)
                Colors.BlackBoard.mainColor
                    .frame(width: 770, height: 1084)
                    .cornerRadius(45)
                VStack {
                    Image("Image 1")
                        .resizable()
                        .frame(width: 704, height: 90)
                        .padding()
                    Text("Select the language:")
                        .padding(.bottom, -10)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .font(.title2)
                    Picker("Options:", selection: $selectedLanguageOption) {
                        Text(languageOptions[0]).tag(0)
                    }
                    
                    Text("Select the game mode:")
                        .padding(.bottom, -10)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .font(.title2)
                    
                    Picker("Options:", selection: $viewModel.selectedGameOption) {
                        Text(gameOptions[0]).tag(0)
                        Text(gameOptions[1]).tag(1)
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
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }//: VSTACK
//                .toolbar {
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button(action: {
//                            isShowingHelp.toggle()
//                        }, label: {
//                            Image(systemName: "questionmark.circle")
//                        })
//                    }
//                    
//                    ToolbarItem(placement: .principal) {
//                        Text("Título".uppercased())
//                            .font(.largeTitle)
//                            .fontWeight(.heavy)
//                            .background(
//                                Color.primary
//                                    .frame(height: 6)
//                                    .offset(y: 24)
//                            )
//                    }
//                }
            }
            .sheet(isPresented: $isShowingHelp, content: {
                HelpView()
            })
        }//: NAVSTACK
    }
}
