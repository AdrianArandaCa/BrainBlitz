//
//  AnswerModel.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import Foundation

struct AnswerModel: Identifiable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
}
