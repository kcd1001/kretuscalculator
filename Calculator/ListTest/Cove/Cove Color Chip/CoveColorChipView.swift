//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct CoveColorChipView: View {
    
    var bCoatCoveChipTSA = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 1)
    var bCoatCoveChipTSB = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 0.5)
    var bCoatCoveChipTSColorant = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 16)
    var bCoatCoveChipTexture = stats2(product: "Texture", covRate: 60, MixRat: 1)
    
    var body: some View {
        
//        let chip = ChipOptions()
        let EpoxyCoveChip = EpoxyCoveSelections()
//        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
   //     var TSColorantC2 = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 400, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormCSplash()
                    ThicknessEpoxyCoveColor()

                    CoatChoicesEpoxyCoveChip()
                }.navigationBarTitle("Epoxy Cove Color Chip, 4-6\"", displayMode: .inline)
            }
            .environmentObject(bCoatCoveChipTSA)
            .environmentObject(bCoatCoveChipTSB)
            .environmentObject(bCoatCoveChipTSColorant)
            .environmentObject(bCoatCoveChipTexture)
            .environmentObject(sf)
            .environmentObject(EpoxyCoveChip)
        }
    }


struct CoveColorChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
