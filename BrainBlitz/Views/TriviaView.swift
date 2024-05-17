//
//  TriviaView.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        QuestionView()
            .environmentObject(triviaManager)
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager(apiClient: APIClient()))
    }
}
