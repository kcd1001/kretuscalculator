//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessQuartzSL : View {
    
    let thickness = ["3/16\"", "1/4\""]
    @EnvironmentObject var chip : ChipOptions


    var body: some View {
        VStack {
            HStack {
                Text("System Thickness: 3/16\"-1/4\"")
                    .fontWeight(.heavy)
                Spacer()
 //               ChipRCInfo()
            }.padding()
            Picker(selection: $chip.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: chip.ThicknessSelection) { _ in
                if chip.ThicknessSelection == 0 {
                    UPC_QuartzSL.covRate = 50
                    UPCColorant_QuartzSL.covRate = 50
                }
                if chip.ThicknessSelection == 1 {
                    UPC_QuartzSL.covRate = 35
                    UPCColorant_QuartzSL.covRate = 35
                }
            }
        }
}

struct ThicknessQuartzSL_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
