import Subsonic
import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var title = "Hello Babies!"
    let answerAnalyser = AnswerAnalyser()
    let babies = ["Boy", "Girl", "Dreamer", "Alien"]
    let columns = [
        GridItem(.adaptive(minimum: 250)) 
    ]
    func submit() {
        title = "\(answerAnalyser.processAnswer(text: text))!"
    }
    
    var body: some View {
        VStack {
            Image(systemName: 
                    "face.smiling.fill")
            .imageScale(.large)
            .foregroundColor(.black)
            .padding(.top, 50)
            Text (title)    
                .font(.largeTitle)
            TextField("Do you want to meet a new friend?", text: $text)
                .multilineTextAlignment(.center)
                .frame(width: 300)
            Spacer()
            Button("Submit"){
                submit()   
            }
          Text("Let's find your besty!")
                .font(.largeTitle)
        // Question 1. How to make all background blue? (Not only top part)
        // Color.blue.cornerRadius(15)
        }.padding(.all)
        NavigationView {
            ScrollView {    
                LazyVGrid(columns: columns) { 
                    ForEach(babies, id: \.self){ baby in 
                        Button {
                            play(sound: "\(baby).m4a")
                        } label: {
                            Image(baby)
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(70)    
                                .padding(.horizontal)
                            // Question 2. How to make link on each of the baby so that when you click on baby you can learn details about each of them.
                            // NavigationLink { 
                            // Image(baby) {
                            //         .navigationTitle("Details")      
                            // } label: {
                           //         }
                            }
                        }
                    }
                }
                .navigationTitle("Babies")    
            }
            .navigationViewStyle(.stack)
        }
}
