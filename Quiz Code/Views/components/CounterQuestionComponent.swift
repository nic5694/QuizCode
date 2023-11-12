//
//  CounterQuestionComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct CounterQuestionComponent: View {
    @State var value: Int = 10
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                if value < 20{
                    value += 1
                }
            }, label: {
                Image(systemName: "plus")
            })
            .font(.system(size: 50))
            .foregroundStyle(.black)
            Spacer()
            Text(value.description).supportingTitleTextOnWhiteBackgroundStyle()
           Spacer()
            Button(action: {
                if value > 0 {
                    value -= 1
                }
            }, label: {
                Image(systemName: "minus")
            })
            .font(.system(size: 50))
            .foregroundStyle(.black)
            Spacer()
        }
    }
}

#Preview {
    CounterQuestionComponent()
}
