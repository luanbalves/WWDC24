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
                MotionAnimationView()
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
                        ZStack{
                            Rectangle()
                                .foregroundStyle(Colors.BlackBoard.mainColor.opacity(0.77))
//                                .foregroundStyle(Colors.BlackBoard.mainColor.opacity(0.9))
                                .frame(width: 196, height: 50)
//                                .cornerRadius(13)
                                .shadow(color: Color.black, radius: 3, x: 7.3, y: 7.3)
//                                .shadow(color: Color.black, radius: 7, x: 0, y: 4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(.black, lineWidth: 2)
                                )
                            HStack{
                                Image(systemName: "play.circle")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("Start")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 27))
                                    .fontWeight(.semibold)
                            }
                        }

                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }//: VSTACK
            }
            .sheet(isPresented: $isShowingHelp, content: {
                HelpView()
            })
        }//: NAVSTACK
    }
}
