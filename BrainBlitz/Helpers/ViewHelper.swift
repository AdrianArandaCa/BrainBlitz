//
//  ViewHelper.swift
//  BrainBlitz
//
//  Created by Dev on 11/5/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing() -> some View {
        self
            .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func vSpacing() -> some View {
        self
            .frame(maxHeight: .infinity)
    }
}

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
