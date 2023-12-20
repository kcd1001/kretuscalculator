//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessGarage: View {
    
    let thickness = ["24 mils"]
    @EnvironmentObject var chip : options


    var body: some View {
        VStack {
            HStack {
                Text("Coating Thickness: 24 mils")
                    .fontWeight(.heavy)
                Spacer()
                ChipGarageInfo()
            }
            .padding()

    }
}

struct ThicknessGarage_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
