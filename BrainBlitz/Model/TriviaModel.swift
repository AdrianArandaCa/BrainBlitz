//
//  TriviaModel.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import Foundation

struct TriviaModel: Decodable, Identifiable {
    var category: String
    var id = UUID()
    var correctAnswer: String
    var incorrectAnswers = [String]()
    var question: Question?
    var tags = [String]()
    var type: String = ""
    var difficulty: String = ""
    var regions = [String]()
    var isNiche: Bool = false
    
    var answers: [AnswerModel] {
        do {
            let correct = [AnswerModel(text: correctAnswer, isCorrect: true)]
            let incorrects = incorrectAnswers.map{ answer in
                AnswerModel (text: answer, isCorrect: false)
            }
            let allAnswers = correct + incorrects
            
            return allAnswers.shuffled()
        } catch {
            print("Error setting answers: \(error)")
            return []
        }
    }
    
    enum CodingKeys: CodingKey {
        case category
//        case id
        case correctAnswer
        case incorrectAnswers
        case question
        case tags
        case type
        case difficulty
        case regions
        case isNiche
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(String.self, forKey: .category)
//        self.id = try container.decode(UUID.self, forKey: .id)
        self.correctAnswer = try container.decode(String.self, forKey: .correctAnswer)
        self.incorrectAnswers = try container.decode([String].self, forKey: .incorrectAnswers)
        self.question = try container.decodeIfPresent(Question.self, forKey: .question)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.type = try container.decode(String.self, forKey: .type)
        self.difficulty = try container.decode(String.self, forKey: .difficulty)
        self.regions = try container.decode([String].self, forKey: .regions)
        self.isNiche = try container.decode(Bool.self, forKey: .isNiche)
    }
}

struct Question: Decodable, Identifiable {
    var id = UUID()
    var text: String
    
    enum CodingKeys: CodingKey {
//        case id
        case text
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(UUID.self, forKey: .id)
        self.text = try container.decode(String.self, forKey: .text)
    }
}
