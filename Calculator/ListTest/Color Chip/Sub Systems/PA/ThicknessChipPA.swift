//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessChipPA: View {
    
    let thickness = ["24 mils"]
    @EnvironmentObject var chip : options


    var body: some View {
        VStack {
            HStack {
                Text("System Thickness: 35 mils")
                    .fontWeight(.heavy)
                Spacer()
                ChipPAInfo()
            }
            .padding()

    }
}

struct ThicknessChipPA_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
