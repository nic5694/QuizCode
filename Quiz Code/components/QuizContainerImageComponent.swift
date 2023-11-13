//
//  QuizContainerComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct QuizContainerImageComponent: View {
    var title: String
    var image: Image
    var themeColor: Color
    var body: some View {
        VStack{
            VStack{
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                Text(title).titleHeaderOnColourBackgroundStyle()
                
            }
            .frame(width: 360)
            .background(Color(themeColor))
            VStack{
                Text("Please select your difficulty level.")
                    .frame(width: 300,height: 34)
                    .foregroundStyle(Color.black)
                    
                
                DifficultySelector()
                
                Text("How many questions? (Max 20)").foregroundStyle(Color.black)
                
                CounterQuestionComponent()
                NavigationLink{
                    
                }label: {
                    Button(action: {
                        
                    }, label: {
                        Text("Start")
                    })
                }
                Spacer()
            }
        }
        .frame(width: 360, height: 450)
        .background(Color("BackgroundComponentWhite"))
        .padding(.leading)
    }
      
}

#Preview {
    QuizContainerImageComponent(title: "Php Quiz", image: Image("php"), themeColor: Color.purple)
}
