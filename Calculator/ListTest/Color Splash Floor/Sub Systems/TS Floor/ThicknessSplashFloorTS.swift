//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessSplashFloorTS: View {
    
    let thickness = ["20 mils"]
    @EnvironmentObject var chip : options


    var body: some View {
        VStack {
            HStack {
                Text("System Thickness: 21-48 mils")
                    .fontWeight(.heavy)
                Spacer()
 //               ChipSLInfo()
            }
            .padding()

    }
}

struct ThicknessSplashFloorTS_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessChipSL()
    }
}
}
