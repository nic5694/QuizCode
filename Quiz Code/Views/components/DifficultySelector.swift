//
//  DifficultySelector.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct DifficultySelector: View {
    @State private var didTap: Bool = false
    @State private var tap: [Bool] = [false, false, false]
    @Binding var selectedDifficulty: String
    func selectDifficulty(_ index: Int) {
        for i in 0..<tap.count {
            tap[i] = (i == index)
        }
        selectedDifficulty = ["Easy", "Medium", "Hard"][index]
    }
    init(selectedDifficulty: Binding<String>) {
        self._selectedDifficulty = selectedDifficulty
    }
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                selectDifficulty(0)
            }){
                ZStack{
                    Circle()
                        .frame(height: 100)
                        .foregroundStyle(tap[0] ? .gray : .white)
                    Text("Easy")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                }
            }
            Spacer()
            Button(action: {
                selectDifficulty(1)
            }){
                ZStack{
                    Circle()
                        .frame(height: 100)
                        .foregroundStyle(tap[1] ? .gray : .white)
                    Text("Medium")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                }
            }
            Spacer()
            Button(action: {
                selectDifficulty(2)
            }){
                ZStack{
                    Circle()
                        .frame(height: 100)
                        .foregroundStyle(tap[2] ? .gray : .white)
                    Text("Hard")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DifficultySelector(selectedDifficulty: .constant(""))
}
