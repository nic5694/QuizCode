//
//  QuizContainerComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct QuizContainerComponent: View {
    var image: Image
    var body: some View {
        VStack{
            image
                .resizable()
                .background(Color.white)
        }
        .cornerRadius(20)
        .frame(width: 150, height: 150)
    }
}

#Preview {
    QuizContainerComponent(image: Image("php"))
}
