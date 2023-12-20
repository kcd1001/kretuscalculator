//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessQuartzDB: View {
    
    let thickness = ["3/16\""]
    @EnvironmentObject var chip : options


    var body: some View {
        VStack {
            HStack {
                Text("System Thickness: 3/16\"")
                    .fontWeight(.heavy)
                Spacer()
//                ChipTSInfo()
            }
            .padding()

    }
}

struct ThicknessQuartzTS_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
