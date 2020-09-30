//
//  SliderView.swift
//  SwiftUI Project
//
//  Created by Jack Colley on 28/09/2020.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    var label: String
    
    var body: some View {
        
        VStack {
            Slider(value: $value, in: 0...255, step: 1)
            Text("\(label): \(Int(value))")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: Binding.constant(0), label: "Label")
            .padding()
    }
}
