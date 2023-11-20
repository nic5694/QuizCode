//
//  AnimationGear.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct AnimationGear: View {
    @State private var isRotating = false
    var body: some View {
        Image(systemName: "gearshape")
            .font(.system(size: 50))
            .rotationEffect(.degrees(isRotating ? 360 : 0))
            .onAppear{
//                withAnimation(.linear(duration: 1)
//                    .speed(0.1).repeatForever(autoreverses:false)){
//                        isRotating = 360.0
                withAnimation(.linear(duration: 1)) {
                                   isRotating = true
                    }
            }
    }
}

#Preview {
    AnimationGear()
}
