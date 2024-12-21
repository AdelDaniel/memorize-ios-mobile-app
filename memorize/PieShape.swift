//
//  PieShape.swift
//  memorize
//
//  Created by Adel Nabil on 21/12/2024.
//

import SwiftUI
import CoreGraphics

struct PieShape: Shape{
    let startAngle: Angle = Angle.zero
    var endAngle: Angle = Angle.degrees(45)
    var isClockWide: Bool = true
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var radius = min(rect.width, rect.height) / 2
        var centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        var startPoint = CGPoint(
            x: centerPoint.x + radius * cos(startAngle.radians),
            y: centerPoint.y + radius * sin(startAngle.radians)
        )
        
        
        path.move(to: centerPoint)
        path.addLine(to: startPoint)
        path.addArc(
            center: centerPoint,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !isClockWide
        )
        
        
        
        
        return path
    }
    
    
}
