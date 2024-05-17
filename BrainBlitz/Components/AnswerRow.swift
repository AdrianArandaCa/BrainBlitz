//
//  AnswerRow.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import SwiftUI

struct AnswerRow: View {
    
    var answer: AnswerModel
    @State private var isSelected = false
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green : .red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(isSelected ? Color("AccentColor") : .gray)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            isSelected = true
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: AnswerModel(text: "Single", isCorrect: false))
            .environmentObject(TriviaManager(apiClient: APIClient()))
    }
}
