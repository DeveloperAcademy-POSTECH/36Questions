import SwiftUI

struct ContentView: View {
    @State private var currentQuestion: String = "질문을 생성해주세요."
    @State private var questionsLog: [String] = ["질문 내역"]
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            HStack {
                ForEach(0..<3) { value in
                    Button(action: {
                        let question = getQuestion(from: value)
                        currentQuestion = question
                        questionsLog.append(question)
                    }, label: {
                        Text("Set \(value+1) 질문")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.brown)
                            )
                    })
                }
            }
            
            Text(currentQuestion)
                .font(.title2)
                .lineSpacing(3)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5.0]))
                        .foregroundColor(.indigo)
                )
            
            List {
                ForEach(questionsLog, id: \.self) { question in
                    Text(question)
                }
            }
            .listStyle(.plain)
                            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
    
    func getQuestion(from number: Int) -> String {
        let set = sets[number]
        return set[Int.random(in: 0 ..< set.count)]
    }
}
