//
//  MotionAnimationView.swift
//  SwiftStudentChallenge
//
//  Created by Luan Alves Barroso on 24/02/24.
//

import SwiftUI

struct MotionAnimationView: View {
  // MARK: - PROPERTIES
  
  @State private var randomCircle: Int = Int.random(in: 10...20)
  @State private var isAnimating: Bool = false
  
  // MARK: - FUNCTIONS
  
  // 1. RANDOM COORDINATE
  func randomCoordinateX() -> CGFloat {
    return CGFloat.random(in: 0...770)
  }
    
    func randomCoordinateY() -> CGFloat {
      return CGFloat.random(in: 0...1084)
    }
  
  // 2. RANDOM SIZE
  func randomSize() -> CGFloat {
    return CGFloat(Int.random(in: 4...80))
  }
  
  // 3. RANDOM SCALE
  func randomScale() -> CGFloat {
      return CGFloat(Double.random(in: 1.0...4.0))
  }
  
  // 4. RANDOM SPEED
  func randomSpeed() -> Double {
    return Double.random(in: 0.05...1.0)
  }
  
  // 5. RANDOM DELAY
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }
  
  var body: some View {
    ZStack {
      ForEach(0...randomCircle, id: \.self) { item in
//        Circle()
          Image(systemName: "pencil")
          .foregroundColor(.white)
          .opacity(0.2)
          .frame(width: randomSize())
          .position(
            x: randomCoordinateX(),
            y: randomCoordinateY()
          )
          .scaleEffect(isAnimating ? randomScale() : 2)
          .onAppear(perform: {
            withAnimation(
              .interpolatingSpring(stiffness: 0.25, damping: 0.25)
              .repeatForever()
              .speed(randomSpeed())
              .delay(randomDelay())
            ) {
              isAnimating = true
            }
          })
          Image(systemName: "eraser")
          .foregroundColor(.white)
          .opacity(0.2)
          .frame(width: randomSize())
          .position(
            x: randomCoordinateX(),
            y: randomCoordinateY()
          )
          .scaleEffect(isAnimating ? randomScale() : 1)
          .onAppear(perform: {
            withAnimation(
              .interpolatingSpring(stiffness: 0.25, damping: 0.25)
              .repeatForever()
              .speed(randomSpeed())
              .delay(randomDelay())
            ) {
              isAnimating = true
            }
          })
      }
    } //: ZSTACK
    .frame(width: 770, height: 1084)
    .mask(Rectangle())
    .drawingGroup()
  }
}

struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
      .background(
        Circle()
          .fill(.teal)
      )
  }
}
