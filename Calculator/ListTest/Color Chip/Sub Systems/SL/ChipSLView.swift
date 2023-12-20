//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct ChipSLView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let ChipSL = ColorChipValuesSL()
        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.125, MixRat: 55)
        let PolyColorant_PA = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 600, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessChipSL()
                    SysOptionsChipSL()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSL()
                }.navigationBarTitle("Color Chip SL", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(Broadcast)
            .environmentObject(PolyColorant_PA)
            .environmentObject(sf)
            .environmentObject(ChipSL)
        }
    }


struct ChipSLView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
