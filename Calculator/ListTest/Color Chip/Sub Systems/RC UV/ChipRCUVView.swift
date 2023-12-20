//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct ChipRCUVView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipRCUV = ColorChipValuesRCUV()
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
                    ThicknessRCUV()
                    SysOptionsRCUV()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesRCUV()
                               
                }.navigationBarTitle("Color Chip RC UV", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(PolyColorant_PA)
            .environmentObject(sf)
            .environmentObject(ChipRCUV)
            .environmentObject(BCoatUPCA)
            .environmentObject(BCoatUPCB)
            .environmentObject(BCoatUPCC)
            .environmentObject(BCoatUPCD)
        }
    }


struct ChipRCUVView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
