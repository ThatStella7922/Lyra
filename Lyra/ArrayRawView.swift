//
//  ArrayRawView.swift
//  Lyra
//
//  Created by Stella Luna on 11/29/23.
//

import Foundation
import SwiftUI

struct ArrayRawView: View {
    @State private var arrayText = ""
    
    var body: some View {
        VStack {
            TextEditor(text: .constant(self.arrayText))
                .font(.custom("SF Mono", size: 13))
                .lineSpacing(5.0)
        }.frame(minWidth: 500, minHeight: 400)
            .onAppear() {
                arrayText = String(describing: GetIOPSArray())

            }
    }
}

#Preview {
    ArrayRawView()
}

