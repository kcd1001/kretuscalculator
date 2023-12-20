//
//  PCoatPicker.swift
//  Calculator
//
//  Created by Kane Davidson on 11/22/21.
//

import SwiftUI

struct PCoatPicker: View {
    @EnvironmentObject var ChipPA : ColorChipValuesPA //Used for coat selections

    let typesA = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    var PartAHardeners = ["EZ - Clear", "Fast - Clear"]
    
    var PtBCodes = ["EX-KPLY72B-01","EX-KPLY85B-01", "EX-KPLY92B-01", "EX-KPLYHSB-EA"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let Hardeners = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    let HardenerCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    var body: some View {
        
            Picker(selection: $ChipPA.PCoatPtA,
                label: ZStack {
                    Text("\(typesA[ChipPA.PCoatPtA])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                      //  .padding()
            }) {
                ForEach (0 ..< typesA.count, id: \.self) { index in
                    Text(self.typesA[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            Picker(selection: $ChipPA.PCoatHardener,
                label: ZStack {
                    Text("\(PartAHardeners[ChipPA.PCoatHardener])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                      //  .padding()
            }) {
                ForEach (0 ..< PartAHardeners.count, id: \.self) { index in
                    Text(self.PartAHardeners[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
         
    }
}

struct PCoatPicker_Previews: PreviewProvider {
    static var previews: some View {
        PCoatPicker()
    }
}
