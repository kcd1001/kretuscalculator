//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessESDSL: View {
    
    let thickness = ["3/8\""]
    @EnvironmentObject var chip : options


    var body: some View {
        VStack {
            HStack {
                Text("System Thickness: 3/8\"")
                    .fontWeight(.heavy)
                Spacer()
//                ChipTSInfo()
            }
            .padding()

    }
}

struct ThicknessESDRC_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
