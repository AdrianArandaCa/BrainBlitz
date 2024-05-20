//
//  QuestionView.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager : TriviaManager
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Trivia Game")
                    .lilacTitle()
                Spacer()
                
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(Color("AccentColor"))
            }
            ProgressBar(progress: triviaManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(triviaManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color(red: 142/255, green: 164/255, blue: 132/255))
                ForEach(triviaManager.answerChoices, id:\.id) { answer in
                    AnswerRow(answer: answer).environmentObject(triviaManager)
                }
            }
            
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color("AccentColor") : .gray)
            }
            .disabled(!triviaManager.answerSelected)
            
            Spacer()
            
        }
        .padding()
        .vSpacing()
        .hSpacing()
        .background(Color(red: 248/255, green: 232/255, blue: 175/255))
        .navigationBarBackButtonHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager(apiClient: APIClient()))
    }
}
