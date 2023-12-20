//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct CoveColorQuartzView: View {
    
    var bCoatCoveQuartzTSA = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 1)
    var bCoatCoveQuartzTSB = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 0.5)
    var bCoatCoveQuartzTSColorant = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 16)
    var bCoatCoveQuartzTexture = stats2(product: "Texture", covRate: 60, MixRat: 1)
    
    var body: some View {
        
//        let chip = ChipOptions()
        let EpoxyCoveChip = EpoxyCoveSelections()
//        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
   //     var TSColorantC2 = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 400, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormCSplash()
                    ThicknessEpoxyCoveColorQuartz()

                    CoatChoicesEpoxyCoveQuartz()
                }.navigationBarTitle("Epoxy Cove Color Quartz, 4-6\"", displayMode: .inline)
            }
            .environmentObject(bCoatCoveQuartzTSA)
            .environmentObject(bCoatCoveQuartzTSB)
            .environmentObject(bCoatCoveQuartzTSColorant)
            .environmentObject(bCoatCoveQuartzTexture)
            .environmentObject(sf)
            .environmentObject(EpoxyCoveChip)
        }
    }


struct CoveColorQuartzView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
