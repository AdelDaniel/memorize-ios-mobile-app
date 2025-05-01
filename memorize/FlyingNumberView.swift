//
//  FlyingNumberView.swift
//  memorize
//
//  Created by Adel Nabil on 15/03/2025.
//

import SwiftUI

struct FlyingNumberView: View {
    let number: Int
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumberView(number: -1)
}
