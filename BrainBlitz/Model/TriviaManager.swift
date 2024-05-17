//
//  TriviaManager.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [TriviaModel] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: String = ""
    @Published private(set) var answerChoices: [AnswerModel] = []
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var score: Int = 0
    
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    @MainActor
    func getTrivia() async {
        self.trivia = await apiClient.fetchTrivia()
        self.length = self.trivia.count
        self.setQuestion()
    }
    
//    func fetchTrivia() async {
//        guard let url = URL(string: "https://the-trivia-api.com/v2/questions") else { fatalError("Missing URL") }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        do {
//            let (data, response) = try await URLSession.shared.data(for: urlRequest)
//            
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
//            
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let decodedData = try decoder.decode([TriviaModel].self, from: data)
//            
//            DispatchQueue.main.async {
//                self.trivia = decodedData
//                self.length = self.trivia.count
//                self.setQuestion()
//            }
//        } catch {
//            print("Error fetching trivia: \(error)")
//        }
//    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            self.question = currentTriviaQuestion.question?.text ?? ""
            self.answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: AnswerModel) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
