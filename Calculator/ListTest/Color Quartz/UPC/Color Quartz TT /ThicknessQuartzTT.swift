//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessQuartzTT: View {
    
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
                    UPC_QuartzTT.covRate = 24
                    UPCColorant_QuartzTT.covRate = 24
                }
                if chip.ThicknessSelection == 1 {
                    UPC_QuartzTT.covRate = 14
                    UPCColorant_QuartzTT.covRate = 14
                }
            }
        }
}

struct ThicknessQuartzTT_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
