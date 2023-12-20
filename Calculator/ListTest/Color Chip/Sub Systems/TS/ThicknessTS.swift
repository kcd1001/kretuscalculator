//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessTS: View {
    
    let thickness = ["24 mils"]
    @EnvironmentObject var chip : options


    var body: some View {
        VStack {
            HStack {
//                Text("System Thickness: 35 mils")
//                    .fontWeight(.heavy)
                Spacer()
//                ChipTSInfo()
            }
            .padding()

    }
}

struct ThicknessTS_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
