//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessSandTS: View {
    
    let thickness = ["1/8\""]
    @EnvironmentObject var chip : options


    var body: some View {
        VStack {
            HStack {
                Text("System Thickness: 1/8\"")
                    .fontWeight(.heavy)
                Spacer()
//                ChipTSInfo()
            }
            .padding()

    }
}

struct ThicknessSandTS_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
