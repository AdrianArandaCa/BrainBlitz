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
                
                Text("1 out of 10")
                    .foregroundColor(Color("AccentColor"))
            }
            ProgressBar(progress: 40)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Who was the executive producer of 'Ugly Betty' and also guest starred as Sofia Reyes?")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                AnswerRow(answer: AnswerModel(text: "Salma Hayek", isCorrect: true))
                    .environmentObject(triviaManager)
                AnswerRow(answer: AnswerModel(text: "Penelope Cruz", isCorrect: false))
                    .environmentObject(triviaManager)
                AnswerRow(answer: AnswerModel(text: "Salma Hayek", isCorrect: true))
                    .environmentObject(triviaManager)
                AnswerRow(answer: AnswerModel(text: "Penelope Cruz", isCorrect: false))
                    .environmentObject(triviaManager)
            }
            
            PrimaryButton(text: "Next")
            
            Spacer()
            
        }
        .padding()
        .vSpacing()
        .hSpacing()
        .background(.white)
        .navigationBarBackButtonHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager(apiClient: APIClient()))
    }
}
