//
//  DifficultySelector.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct DifficultySelector: View {
    @State private var tap: [Bool] = [false, false, false]
    @Binding var selectedDifficulty: String

    func selectDifficulty(_ index: Int) {
        for i in 0..<tap.count {
            tap[i] = (i == index)
        }
    }

    init(selectedDifficulty: Binding<String>) {
        self._selectedDifficulty = selectedDifficulty
    }

    var body: some View {
        HStack {
            Spacer()
            difficultyButton(index: 0, label: "Easy")
            Spacer()
            difficultyButton(index: 1, label: "Medium")
            Spacer()
            difficultyButton(index: 2, label: "Hard")
            Spacer()
        }
        .onChange(of: tap) { _ in
            // Whenever the tap array changes, update the selectedDifficulty binding
            if let selectedIndex = tap.firstIndex(of: true) {
                selectedDifficulty = ["Easy", "Medium", "Hard"][selectedIndex]
            }
        }
        .onAppear {
            // Simulate tap if selectedDifficulty is not empty or nil
            if let selectedIndex = ["Easy", "Medium", "Hard"].firstIndex(of: selectedDifficulty) {
                tap[selectedIndex] = true
            }
        }
        .frame(maxWidth: .infinity)
    }

    private func difficultyButton(index: Int, label: String) -> some View {
        Button(action: {
            selectDifficulty(index)
        }) {
            ZStack {
                Circle()
                    .frame(height: 100)
                    .foregroundStyle(tap[index] ? .gray : .white)
                Text(label)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    DifficultySelector(selectedDifficulty: .constant("Medium"))
}
