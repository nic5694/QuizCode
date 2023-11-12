//
//  CustomStyling.swift
//  Quiz Code
//
//  Created by nic on 2023-11-12.
//

import SwiftUI

struct TitleHeaderOnColourBackground : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(.white)
        
    }
}
struct TitleHeaderOnWhiteBackground : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(.black)
        
    }
}
struct SupportingTitleTextOnBlueBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
    }
}
struct SupportingTitleTextOnWhiteBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
    }
}

extension View {
    func titleHeaderOnColourBackgroundStyle()-> some View {
        modifier(TitleHeaderOnColourBackground())
    }
    func titleHeaderOnWhiteBackgroundStyle()-> some View {
        modifier(TitleHeaderOnWhiteBackground())
    }
    func supportingTitleTextOnBlueBackgroundStyle()-> some View{
        modifier(SupportingTitleTextOnBlueBackground())
    }
    func supportingTitleTextOnWhiteBackgroundStyle()-> some View{
        modifier(SupportingTitleTextOnWhiteBackground())
    }
    
}


