//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct CoveColorView: View {
    
    var bCoatCoveTSA = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 1)
    var bCoatCoveTSB = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 0.5)
    var bCoatCoveTSColorant = stats2(product: "Top Shelf Epoxy Part A", covRate: 60, MixRat: 16)
    var bCoatCoveTexture = stats2(product: "Texture", covRate: 60, MixRat: 1)
    
    var body: some View {
        
//        let chip = ChipOptions()
        let EpoxyCove = EpoxyCoveSelections()
//        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
   //     var TSColorantC2 = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 400, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormCove()
                    ThicknessEpoxyCoveColor()

                    CoatChoicesEpoxyCove()
                }.navigationBarTitle("Epoxy Cove Color, 4-6\"", displayMode: .inline)
            }
            .environmentObject(bCoatCoveTSA)
            .environmentObject(bCoatCoveTSB)
            .environmentObject(bCoatCoveTSColorant)
            .environmentObject(bCoatCoveTexture)
            .environmentObject(sf)
            .environmentObject(EpoxyCove)
        }
    }


struct CoveColorView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
