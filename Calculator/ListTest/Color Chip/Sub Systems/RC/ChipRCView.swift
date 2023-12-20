//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct ChipRCView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipRC = ColorChipValuesRC()
        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
        let PolyColorant_PA = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 600, MixRat: 16)
        let sf = SquareFeet()
        let BCoatUPCA = stats2(product: "Urethane Polymer Concrete Part A:", covRate: 190, MixRat: 6)
        let BCoatUPCB = stats2(product: "Urethane Polymer Concrete Part B:", covRate: 190, MixRat: 6)
        let BCoatUPCC = stats2(product: "Urethane Polymer Concrete Part C:", covRate: 190, MixRat: 6)
        let BCoatUPCD = stats2(product: "Urethane Polymer Concrete Part C:", covRate: 190, MixRat: 6)
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessChipRC()
                    SysOptionsChipRC()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesRC()
                               
                }.navigationBarTitle("Color Chip RC", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(PolyColorant_PA)
            .environmentObject(sf)
            .environmentObject(ChipRC)
            .environmentObject(BCoatUPCA)
            .environmentObject(BCoatUPCB)
            .environmentObject(BCoatUPCC)
            .environmentObject(BCoatUPCD)
        }
    }


struct ChipRCView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
