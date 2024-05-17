//
//  APIClient.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import Foundation

final class APIClient {
    func fetchTrivia() async -> [TriviaModel] {
        guard let url = URL(string: "https://the-trivia-api.com/v2/questions") else { fatalError("Missing URL") }
        let (data, response) = try! await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        if let triviaModelResponses = try? JSONDecoder().decode([TriviaModel].self, from: data) {
            print("\(triviaModelResponses)")
            return triviaModelResponses
        }
        return []
    }
}
