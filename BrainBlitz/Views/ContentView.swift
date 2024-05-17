//
//  ContentView.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var triviaManager = TriviaManager(apiClient: APIClient())
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Trivia Game")
                        .lilacTitle()
                    
                    Text("Are you ready to test out your trivia skills?")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
            }
            .hSpacing()
            .vSpacing()
            .edgesIgnoringSafeArea(.all)
        .background(.white)
        }.onAppear{
            Task {
                await triviaManager.getTrivia()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
