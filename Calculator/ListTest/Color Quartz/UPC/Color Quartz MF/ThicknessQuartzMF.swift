//
//  ThicknessGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ThicknessQuartzMF : View {
    
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
                    UPC_QuartzMF.covRate = 35
                    UPCColorant_QuartzMF.covRate = 35
                }
                if chip.ThicknessSelection == 1 {
                    UPC_QuartzMF.covRate = 25
                    UPCColorant_QuartzMF.covRate = 25
                }
            }
        }
}

struct ThicknessQuartzMF_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessGarage()
    }
}
}
