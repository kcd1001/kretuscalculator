//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessSandRC: View {
    
    let thickness = ["1/8\""]
    @EnvironmentObject var chip : options


    var body: some View {
        VStack {
            HStack {
                Text("System Thickness: 1/16\" - 1/8\"")
                    .fontWeight(.heavy)
                Spacer()
//                ChipTSInfo()
            }
            .padding()

    }
}

struct ThicknessSandRC_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
