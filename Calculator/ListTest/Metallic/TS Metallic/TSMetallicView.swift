//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct MetallicView: View {
    
    var bCoatMetallicTSA = stats2(product: "Top Shelf Epoxy Part A", covRate: 120, MixRat: 1)
    var bCoatMetallicTSB = stats2(product: "Top Shelf Epoxy Part A", covRate: 120, MixRat: 0.5)
    var bCoatMetallicPigment = stats2(product: "Top Shelf Epoxy Part A", covRate: 120, MixRat: 16)
    
    var body: some View {
        
//        let chip = ChipOptions()
        let tsMetallic = EpoxyCoveSelections()
//        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
   //     var TSColorantC2 = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 400, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormCSplash()
                    CoatChoicesTSMetallic()
                }.navigationBarTitle("Top Shelf® Metallic, 15-50 WFT", displayMode: .inline)
            }
            .environmentObject(bCoatMetallicTSA)
            .environmentObject(bCoatMetallicTSB)
            .environmentObject(bCoatMetallicPigment)
            .environmentObject(sf)
            .environmentObject(tsMetallic)
        }
    }


struct MetallicView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
