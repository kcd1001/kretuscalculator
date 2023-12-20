//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessSandTG: View {
    
    let thickness = ["1/4\"", "3/8\""]
    @EnvironmentObject var chip : ChipOptions


    var body: some View {
        VStack {
            HStack {
                Text("System Thickness: 1/4\"-3/8\"")
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
                    TSABC_SandTG.covRate = 44
                    TSBBC_SandTG.covRate = 44
                    TSColorantBC_SandTG.covRate = 44
                }
                if chip.ThicknessSelection == 1 {
                    TSABC_SandTG.covRate = 22
                    TSBBC_SandTG.covRate = 22
                    TSColorantBC_SandTG.covRate = 22
                }
            }
        }
}

struct ThicknessSandTS_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
